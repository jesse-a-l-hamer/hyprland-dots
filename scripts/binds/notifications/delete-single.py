import json
import re
import subprocess
from abc import ABC, abstractmethod
from argparse import ArgumentParser
from subprocess import CompletedProcess
from typing import Any, NewType

arg_parser = ArgumentParser()

arg_parser.add_argument("notifier", choices=["dunst", "wayle"], default="dunst")


class App(ABC):
    def __init__(self):
        return

    def is_dnd(self) -> bool:
        result = self._get_dnd_result()
        return self._parse_dnd_result(result)

    @abstractmethod
    def _get_dnd_result(self) -> CompletedProcess[bytes]:
        return NotImplemented

    @abstractmethod
    def _parse_dnd_result(self, result: CompletedProcess[bytes]) -> bool:
        return NotImplemented

    def get_history_count(self) -> int:
        result = self._get_history_count_result()
        return self._parse_history_count_result(result)

    @abstractmethod
    def _get_history_count_result(self) -> CompletedProcess[bytes]:
        return NotImplemented

    @abstractmethod
    def _parse_history_count_result(self, result: CompletedProcess[bytes]) -> int:
        return NotImplemented

    def get_history(self) -> list[dict[str, Any]]:
        result = self._get_history_result()
        return self._parse_history_result(result)

    @abstractmethod
    def _get_history_result(self) -> CompletedProcess[bytes]:
        return NotImplemented

    @abstractmethod
    def _parse_history_result(
        self, result: CompletedProcess[bytes]
    ) -> list[dict[str, Any]]:
        return NotImplemented

    def remove_top_notification(self, notification: dict[str, Any]):
        top_notification_id = self._get_top_notification_id(notification)
        if top_notification_id:
            self._remove_top_notification(top_notification_id)

    @abstractmethod
    def _get_top_notification_id(self, notification: dict[str, Any]) -> str:
        return NotImplemented

    @abstractmethod
    def _remove_top_notification(self, top_notification_id: str):
        return NotImplemented


class DunstApp(App):
    def _get_dnd_result(self) -> CompletedProcess[bytes]:
        return subprocess.run(
            ["dunstctl", "get-pause-level"], stdout=subprocess.PIPE, check=True
        )

    def _parse_dnd_result(self, result: CompletedProcess[bytes]) -> bool:
        return result.stdout.decode("utf-8").strip() != "0"

    def _get_history_count_result(self) -> CompletedProcess[bytes]:
        return subprocess.run(
            ["dunstctl", "count", "history"], stdout=subprocess.PIPE, check=True
        )

    def _parse_history_count_result(self, result: CompletedProcess[bytes]) -> int:
        return int(result.stdout.decode("utf-8").strip())

    def _get_history_result(self) -> CompletedProcess[bytes]:
        return subprocess.run(
            ["dunstctl", "history"], stdout=subprocess.PIPE, check=True
        )

    def _parse_history_result(
        self, result: CompletedProcess[bytes]
    ) -> list[dict[str, Any]]:
        return json.loads(result.stdout.decode("utf-8"))["data"][0]

    def _get_top_notification_id(self, notification: dict[str, Any]) -> str:
        return str(notification.get("id", {}).get("data", ""))

    def _remove_top_notification(self, top_notification_id: str):
        subprocess.run(
            ["dunstctl", "history-rm", top_notification_id], check=True, timeout=5
        )


class WayleApp(App):
    def _get_dnd_result(self) -> CompletedProcess[bytes]:
        return subprocess.run(
            ["wayle", "notify", "status"], check=True, stdout=subprocess.PIPE
        )

    def _parse_dnd_result(self, result: CompletedProcess[bytes]) -> bool:
        lines = result.stdout.decode("utf-8").strip().splitlines()
        parsed = {k.strip(): v.strip() for line in lines for k, v in line.split(": ")}
        return parsed["Do Not Disturb"] == "enabled"

    def _get_history_count_result(self) -> CompletedProcess[bytes]:
        return subprocess.run(
            ["wayle", "notify", "status"], check=True, stdout=subprocess.PIPE
        )

    def _parse_history_count_result(self, result: CompletedProcess[bytes]) -> int:
        lines = result.stdout.decode("utf-8").strip().splitlines()
        parsed = {k.strip(): v.strip() for line in lines for k, v in line.split(": ")}
        return int(parsed["Notifications"])

    def _get_history_result(self) -> CompletedProcess[bytes]:
        return subprocess.run(
            ["wayle", "notify", "list"], check=True, stdout=subprocess.PIPE
        )

    def _parse_history_result(
        self, result: CompletedProcess[bytes]
    ) -> list[dict[str, Any]]:
        notifs = "\n".join(
            line.strip()
            for line in result.stdout.decode("utf-8").strip().splitlines()[1:]
        )
        pat = r"\[(?P<id>\d+)\] (?P<app>.+):(?P<summary> .*)"
        return sorted(
            [m.groupdict() for m in re.finditer(pat, notifs)],
            key=lambda g: int(g["id"]),
        )

    def _get_top_notification_id(self, notification: dict[str, Any]) -> str:
        return notification["id"]

    def _remove_top_notification(self, top_notification_id: str):
        subprocess.run(
            ["wayle", "notify", "dismiss", top_notification_id], check=True, timeout=5
        )


APP_BY_NOTIFIER: dict[str, type[NewType[App]]] = {
    "dunct": DunstApp,
    "wayle": WayleApp,
}


def main(notifier: str):
    app = APP_BY_NOTIFIER[notifier]()
    if not app.is_dnd() and app.get_history_count() > 0:
        history = app.get_history()
        app.remove_top_notification(history[0])


if __name__ == "__main__":
    parsed_args = arg_parser.parse_args()
    main(notifier=parsed_args.notifier)

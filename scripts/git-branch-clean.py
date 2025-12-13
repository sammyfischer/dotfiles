#!/usr/bin/env python3
import subprocess
import re
import sys


def get_branch_output():
    try:
        output = subprocess.check_output(
            ["git", "branch", "-vv"],
            stderr=subprocess.DEVNULL,
            universal_newlines=True
        )
        return output.strip().split('\n')
    except subprocess.CalledProcessError:
        print("Error: Not in a git repository or unable to run git.")
        sys.exit(1)


def delete_branch(branch_name):
    try:
        subprocess.run(["git", "branch", "-d", branch_name], check=True)
    except subprocess.CalledProcessError:
        print(f"Failed to delete branch: {branch_name}")


def main():
    lines = get_branch_output()
    gone_pattern = re.compile(r"^\*?\s*(?P<branch>\S+)\s+[a-f0-9]{7} \[\S+: gone].+$")

    for line in lines:
        match = gone_pattern.match(line)
        if match:
            branch = match.group("branch")
            delete_branch(branch)


if __name__ == "__main__":
    main()

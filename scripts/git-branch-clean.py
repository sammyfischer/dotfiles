#!/usr/bin/env python3
import subprocess
import re
import sys

def setup():
    try:
        print("Fetching from remote")
        subprocess.run(["git", "fetch", "origin", "-p", "--tags"])
        print("Bringing changes into master")
        subprocess.run(["git", "fetch", "origin", "master:master"])
    except subprocess.CalledProcessError:
        print("Failed to pull changes")
        sys.exit(1)


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
        subprocess.run(["git", "branch", "-D", branch_name], check=True)
    except subprocess.CalledProcessError:
        print(f"Failed to delete branch: {branch_name}")


def main():
    lines = get_branch_output()
    gone_pattern = re.compile(r"^[  ]\s+(\S+)\s+[a-f0-9]{8}\s+\[origin/[^:]+: gone\]")

    for line in lines:
        match = gone_pattern.match(line)
        if match:
            branch = match.group(1)
            delete_branch(branch)


if __name__ == "__main__":
    main()

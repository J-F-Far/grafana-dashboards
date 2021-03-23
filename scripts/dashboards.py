#!/bin/python

import subprocess
from pathlib import Path

def make_dest_path(src_path):
    """
    Given a source path of the form ./src/**/<stem>.jsonnet, create a path 
    to the resulting dashboard at ./dashboards/**/<stem>.json and return it.
    """

    path = src_path.parts[1:-1]
    src_stem = Path(src_path.parts[-1]).stem

    dest = Path("./dashboards", *path, ".".join((src_stem, 'json')))
    return dest


def generate_dashboard(src, dest):
    """
    Run the Grafonnet command to generate the dashboards.
    """
    
    dest.parent.mkdir(parents=True, exist_ok=True)
    with dest.open('w+') as out:
        cp = subprocess.run(
            ["jsonnet","-J","grafonnet-lib",f"{src}"],
            stdout=out
            )


if __name__ == "__main__":
    p = Path('./src')
    src_files = p.glob('**/*.jsonnet')

    for s in src_files:
        dest = make_dest_path(s)

        generate_dashboard(s, dest)



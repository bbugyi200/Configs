#!/usr/bin/env python3

{% INSERT %}

import sys
from typing import NamedTuple, Sequence

from loguru import logger as log  # pylint: disable=unused-import

import gutils


Arguments = NamedTuple("Arguments", [("debug", bool), ("verbose", bool)])


@gutils.catch
def main(argv: Sequence[str] = None) -> int:
    if argv is None:
        argv = sys.argv

    args = parse_cli_args(argv)
    gutils.logging.configure(__file__, debug=args.debug, verbose=args.verbose)

    return 0


def parse_cli_args(argv: Sequence[str]) -> Arguments:
    parser = gutils.ArgumentParser()

    args = parser.parse_args(argv[1:])

    return Arguments(**dict(args._get_kwargs()))


if __name__ == "__main__":
    sys.exit(main())

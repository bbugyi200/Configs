"""Sets up logging.

Attributes:
    logger: log.Logger object used for logging taskwarrior hooks.
"""

import logging

import gutils


def _add_handers(logger):
    """Adds logging handlers to @logger.

    Args:
        level (opt): Logging level. Defaults to logging.DEBUG.
    """
    if _STREAM_LOGGING_LEVEL == logging.INFO:
        max_level = logging.DEBUG
    else:
        max_level = _STREAM_LOGGING_LEVEL

    fh = logging.FileHandler('/var/tmp/taskwarrior-hooks.log')
    sh = logging.StreamHandler()

    logger.setLevel(max_level)
    fh.setLevel(max_level)
    sh.setLevel(_STREAM_LOGGING_LEVEL)

    formatter = gutils.logging.getFormatter(verbose=True)
    fh.setFormatter(formatter)
    sh.setFormatter(formatter)

    logger.addHandler(fh)
    logger.addHandler(sh)


logger = logging.getLogger(__name__)
gutils.logging.add_vdebug_level(logging)

_STREAM_LOGGING_LEVEL = logging.INFO
_add_handers(logger)

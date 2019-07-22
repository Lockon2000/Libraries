# This is a python implementation for a curry function, which according to the arguments
# either evaluates the function or returns a partial function.
# IMPORTANT: The current implementation doesn't handle keyword arguments correctly.
from inspect import signature as sig

def curry(func):
    def curried(*args):
        if len(args) >= len(sig(func).parameters):
            return func(*args)
        else:
            def partial(*args2):
                return curried(*(args+args2))

            return partial

    return curried

    
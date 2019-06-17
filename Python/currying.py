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

    
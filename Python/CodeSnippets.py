# Dynamical variant for "from <module> import *"
module = importlib.import_module('<module>')

globals().update(
    {n: getattr(module, n) for n in module.__all__} if hasattr(module, '__all__') 
    else 
    {k: v for (k, v) in module.__dict__.items() if not k.startswith('_')
})
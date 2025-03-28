"""pdb++ configuration

See:
- https://github.com/pdbpp/pdbpp#configuration-and-customization
"""
import pdb


class Config(pdb.DefaultConfig):
    sticky_by_default = True

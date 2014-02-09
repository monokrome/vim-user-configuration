#!/usr/bin/env python

try:
    import ycm_core
except ImportError:
    raise EnvironmentError(
        'This script can only be run within the Vim environment with '
        'YouCompleteMe properly installed. YouCompleteMe can be found at: '
        'https://github.com/Valloric/YouCompleteMe/'
    )


import multiprocessing.dummy
import os


class FlagProvider(object):
    cache = True

    def get_flags(self, filename, details):
        raise NotImplementedError(self.__class__.__name__ + ' is abstract.')


class CompilationDatabaseProvider(FlagProvider):
    def __init__(self):
        self.database = None

        compilation_directory = None

        for root, dirs, files in os.walk('.'):
            if 'compile_commands.json' in files:
                compilation_directory = os.path.abspath(root)
                break

        if compilation_directory is not None:
            self.database = ycm_core.CompilationDatabase(compilation_directory)

    def get_flags(self, filename, details):
        result = self.database.GetCompilationInfoForFile(filename)

        if result is not None:
            return result.compiler_flags_


threaded_pool = multiprocessing.dummy.Pool()

provider_types = (
    CompilationDatabaseProvider,
)


def instantiate_class(subject):
    return subject()


def get_inspector(self):
    return True


def has_database(provider):
    return provider.database is not None


def FlagsForFile(filename, **details):
    providers = map(instantiate_class, provider_types)
    ready_providers = filter(has_database, providers)

    for index in xrange(len(ready_providers)):
        provider = ready_providers[index]
        flags = provider.get_flags(filename, details)

        if flags is not None:
            return {
                'flags': flags,
                'do_cache': provider.cache,
            }

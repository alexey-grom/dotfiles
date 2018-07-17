import re
import subprocess

import deoplete.util
from .base import Base


class Source(Base):
    GTAGS_DB_NOT_FOUND_ERROR = 3
    FORRBIDDEN_CHARACTERS = [
        '^', '$', '{', '}', '(', ')', '.',
        '*', '+', '[', ']', '?', '\\', '|',
    ]

    def __init__(self, vim):
        super().__init__(vim)

        self.filetypes = []
        self.mark = '[gtags]'
        #  self.matchers = ['matcher_length', 'matcher_full_fuzzy']
        self.name = 'gtags'
        self.max_candidates = 0

    def gather_candidates(self, context):
        word = self.get_search_word(context)
        if not self.is_word_valid_for_search(word):
            return []
        tags = self.exec_global(self.get_search_flags() + ['--', word], context)
        candidates = self._convert_to_candidates(tags)
        return candidates

    def exec_global(self, search_args, context):
        command = ['lglobal', '-q'] + search_args
        global_proc = subprocess.Popen(command,
                                       cwd=context['cwd'],
                                       universal_newlines=True,
                                       stdout=subprocess.PIPE,
                                       stderr=subprocess.PIPE)
        try:
            output, err_output = global_proc.communicate(timeout=15)
        except subprocess.TimeoutExpired:
            global_proc.kill()
            output, err_output = global_proc.communicate()
        global_exitcode = global_proc.returncode

        # Not every project will include a GTAGS file...
        if global_exitcode == self.GTAGS_DB_NOT_FOUND_ERROR:
            return []

        if global_exitcode != 0:
            self.print_global_error(global_exitcode, err_output)
            return []

        return [t for t in output.split('\n') if len(t) > 0]

    def print_global_error(self, global_exitcode, err_output):
        error_message = None
        if global_exitcode == 1:
            pass
            #  error_message = '[deoplete-gtags] Error: file does not exists'
        elif global_exitcode == 2:
            error_message = '[deoplete-gtags] Error: invalid arguments\n{}'.format(err_output)
        elif global_exitcode == 3:
            error_message = '[deoplete-gtags] Error: GTAGS not found'
        elif global_exitcode == 126:
            error_message = '[deoplete-gtags] Error: permission denied\n{}'.format(err_output)
        elif global_exitcode == 127:
            error_message = '[deoplete-gtags] Error: \'global\' command not found\n{}'
        else:
            error_message = '[deoplete-gtags] Error: global command failed\n{}'.format(err_output)
        if error_message:
            deoplete.util.error(self.vim, error_message)

    @classmethod
    def _convert_to_candidates(cls, tags):
        return [{'word': t} for t in tags]

    @classmethod
    def get_search_flags(cls):
        return ['-ci']

    @classmethod
    def get_search_word(cls, context):
        return '{}'.format(context['input'])

    @classmethod
    def is_word_valid_for_search(cls, word):
        for forbbiden_char in cls.FORRBIDDEN_CHARACTERS:
            if forbbiden_char in word:
                return False
        return True

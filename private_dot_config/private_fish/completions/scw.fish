complete --erase --command scw;
complete --command scw --no-files;
complete --command scw --arguments '(scw autocomplete complete fish -- (commandline) (commandline --cursor) (commandline --current-token) (commandline --current-process --tokenize --cut-at-cursor))';

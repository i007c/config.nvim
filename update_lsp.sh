#!/bin/bash

for i in {ts_ls,rust_analyzer,lemminx,jsonls,pylsp,lua_ls,taplo,cssls,dartls,kotlin_language_server,glsl_analyzer}; do
    cp -f nvim-lspconfig/lsp/$i.lua after/lsp/
done

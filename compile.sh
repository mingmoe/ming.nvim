
sed "s/#RUNTIME_PATH#/\"${PWD////\\/}\\/runtime\"/gI" init.lua > init.lua.compiled


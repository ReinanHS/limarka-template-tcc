@echo off
echo Verificando se o Docker esta instalado...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker nao encontrado. Por favor, instale o Docker antes de continuar.
    goto end
)

echo Verificando se o Docker esta em execucao...
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker nao esta em execucao. Por favor, inicie o Docker e tente novamente.
    goto end
)

echo Docker esta instalado e em execucao. Executando markdownlint...
docker run --rm -it -v %cd%:/workdir --entrypoint="/bin/sh" davidanson/markdownlint-cli2 -c "markdownlint-cli2 --config=.markdownlint.yml pages/**/*.md article/**/*.md"

:end

set dotenv-load

email := env_var_or_default("EMAIL", "")
phone := env_var_or_default("PHONE", "")

build:
    typst compile resume.typ resume.pdf \
        --font-path ./fonts \
        --input email="{{email}}" \
        --input phone="{{phone}}"
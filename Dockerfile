# Используем базовый образ
FROM alpine:latest

# Объявляем build-args
ARG NS_USER
ARG NS_DOMAIN
ARG NS_KEY
ARG NS_CPCODE
ARG TEST

# Создаем слой для проверки переменных
RUN echo "Testing build arguments:" && \
    echo "NS_USER: ${NS_USER}" && \
    echo "NS_DOMAIN: ${NS_DOMAIN}" && \
    echo "NS_KEY: ${NS_KEY}" && \
    echo "NS_CPCODE: ${NS_CPCODE}" && \
    export NS_DOMAIN="${NS_DOMAIN}" \
    && export NS_USER="${NS_USER}" \
    && export NS_KEY="${NS_KEY}" \
    && export NS_CPCODE="${NS_CPCODE}" \
    && echo "NS_USER=${NS_USER}" \
    && echo "NS_DOMAIN=${NS_DOMAIN}" \
    && echo "NS_KEY=${NS_KEY}" \
    && echo "NS_CPCODE=${NS_CPCODE}" \
    && echo "TEST: ${TEST}"

# Добавляем команду по умолчанию
CMD ["echo", "Build completed successfully"] 
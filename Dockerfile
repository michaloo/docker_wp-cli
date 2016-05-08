# Uses simplified Wordpress image
FROM michaloo/wordpress-simplified

CMD ["bash"]
ENV WPCLI_VERSION 0.23.1

# Add wp-cli less dep
RUN apt-get update \
    && apt-get install -y less \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install wp-cli
RUN curl -OL https://github.com/wp-cli/wp-cli/releases/download/v${WPCLI_VERSION}/wp-cli-${WPCLI_VERSION}.phar \
    && chmod +x wp-cli-${WPCLI_VERSION}.phar \
    && mv wp-cli-${WPCLI_VERSION}.phar /usr/local/bin/wp

# Enable tab completion and prepare www-data home directory
RUN curl -o /wp-completion.bash https://raw.githubusercontent.com/wp-cli/wp-cli/v${WPCLI_VERSION}/utils/wp-completion.bash \
    && mkdir -p /var/www \
    && echo 'source /wp-completion.bash' > /var/www/.bashrc \
    && chown www-data:www-data -R /var/www

# Switch user to www-data (wp-cli doesn't allow being executed as root)
USER www-data

WORKDIR /var/www/html

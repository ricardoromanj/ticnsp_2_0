FROM rails:latest

RUN apt-get update \
    && apt-get install libmysqlclient-dev -y \
    && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN RAILS_ENV=production bundle install
COPY . .

EXPOSE 3000
CMD ["./startapp.sh", "-e", "dev" ]

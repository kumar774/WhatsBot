FROM buildkite/puppeteer:latest

RUN apt update
RUN apt install ffmpeg -y

WORKDIR /app
COPY . /app
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN npm i --package-lock-only
RUN npm install
CMD ["npm", "start"]
EXPOSE 8080

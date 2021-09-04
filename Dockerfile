FROM node

# задаем рабочую дерикторию (контекст ьтого местоположения где лежат файлы и папки)
WORKDIR /app

# задаем переменную окружения
ENV PATH /app/node_modules/.bin:$PATH

# копируем
COPY package.json yarn.lock ./

# запускаем установку зависимостей
RUN yarn install --frozen-lockfile

# копируем файлы в образ
COPY . .

ENV PORT=4100

# указываем какой порт доступен
EXPOSE $PORT

# запускаем приложение
CMD yarn start

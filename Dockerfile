FROM node:alpine as builder
RUN npm install -g @angular/cli
RUN ng new gestor-inovacao
WORKDIR /gestor-inovacao
RUN npm run build

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /gestor-inovacao/dist/gestor-inovacao /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
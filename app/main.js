const Koa = require('koa');
const app = new Koa();

app.use(async ctx => {
  ctx.body = 'Hello World Codedeploy updated';
});

app.listen(3000);


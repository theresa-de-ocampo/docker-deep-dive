import express from "express";

const app = express();

app.disable("x-powered-by");

app.use("/home", (_, res) => {
  res.send("Welcome");
});

app.use((_, res) => {
  res.send("Not Found");
});

const PORT = 8080;
app.listen(PORT, () => {
  console.log(`App listening at port ${PORT}`);
});

export { app };

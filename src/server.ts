import { app } from "./app";
import { raccsController } from "./routes/raccoons";

app.use(raccsController);

const port = parseInt(process.env.PORT || "3000");

app.listen(port, () => {
  console.log(`raccApi is running on port ${port}`);
});

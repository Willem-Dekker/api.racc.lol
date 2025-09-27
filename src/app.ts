import Elysia from "elysia";
import cors from "@elysiajs/cors";
import mainController from "./routes/main";
import { respond } from "./lib/respond";

export const app = new Elysia({ aot: false })
  .use(cors({ origin: "*" }))
  .onError(({ code, error }: any) => {
    return respond(error.status, {
      success: false,
      message: "An error has occured while requesting",
      code: `${error.status} (${code})`,
    });
  })
  .use(mainController);

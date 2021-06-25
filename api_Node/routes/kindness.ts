import * as express from 'express';
import { User } from '../common'
import { UserController } from "../controllers/userscontroller"
const app = express();

app.get("/globalRank", (req, res) => {
    UserController.getInstance().globalRanking()
    .then(
        (value:any) => {
            res.json(value[0]);
        }
    ).catch((err) => {console.log(err);
        res.json(err)});
});
app.get("/post", (req, res) => {
    const time = req.query["time"].toString();
    const email = req.query["email"].toString();
    UserController.getInstance().newPost(time, email)
    .then(
        (value:any) => {
            res.json(value[0]);
        }
    ).catch((err) => {console.log(err);
        res.json(err)});
});
app.get("/habit", (req, res) => {
    const longitude = Number(req.query["lon"]);
    const latitude = Number(req.query["lat"]);
    const email = req.query["email"].toString();
    const title = req.query["title"].toString();
    const fecha = req.query["fecha"].toString();
    
    
    UserController.getInstance().newhabit(longitude, latitude, email, title, fecha)
    .then(
        (value:any) => {
            res.json(value[0]);
        }
    ).catch((err) => {console.log(err);
        res.json(err)});
});
/*
app.get("/plansperuser", (req, res) => {
    const user = req.query["user"].toString();
    console.log(user)
    UserController.getInstance().PlansPerUser(user)
    .then(
        (value:any) => {
            res.json(value[0]);
        }
    ).catch((err) => {console.log(err);
        res.json(err)});
});

app.get("/FriendList", (req, res) => {
    const user = req.query["user"].toString();
    console.log(user)
    UserController.getInstance().FriendList(user)
    .then(
        (value:any) => {
            res.json(value[0]);
        }
    ).catch((err) => {console.log(err);
        res.json(err)});
});

app.get("/RankingPerMonth", (req, res) => {
    const user = req.query["player"].toString();
    const month = Number(req.query["month"]);
    const gameMode = req.query["gamemode"].toString();
    const ano = req.query["ano"].toString();
    
    UserController.getInstance().RatingPerMonth(gameMode, month, user, ano)
    .then(
        (value:any) => {
            res.json(value[0]);
        }
    ).catch((err) => {console.log(err);
        res.json(err)});
});

app.get("/PartidasPorMes", (req, res) => {
    const user = req.query["player"].toString();
    const month = Number(req.query["month"]);
    const gameMode = req.query["gamemode"].toString();
    const ano = req.query["ano"].toString();
    
    UserController.getInstance().MatchesPerMonth(gameMode, month, user, ano)
    .then(
        (value:any) => {
            res.json(value[0]);
        }
    ).catch((err) => {console.log(err);
        res.json(err)});
});

app.get("/MatchTracing", (req, res) => {
    const nickWhite = req.query["nickWhite"].toString();
    const nickBlack = req.query["nickBlack"].toString();
    const time = req.query["timestamp"].toString();
    
    UserController.getInstance().MatchTracing(nickBlack, nickWhite, time)
    .then(
        (value:any) => {
            res.json(value[0]);
        }
    ).catch((err) => {console.log(err);
        res.json(err)});
});

*/
export { app as kindnessrouter };
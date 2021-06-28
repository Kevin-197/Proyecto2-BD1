
import { Logger, User } from '../common'


const sql = require('mssql')
const poolconfig={
    user: 'changeitapi',
    password: '12345',
    database: 'ChangeitDB',
    server: 'localhost',
    port: 1433,
    pool: {
        max: 3,
        min: 1,
        idleTimeoutMillis: 30000
    },
    options:{
        encrypt: true,
        trustServerCertificate: true
    }
}

const poolglobalconfig={
    user: 'changeitapi',
    password: '12345',
    database: 'ChageitDB',
    server: 'localhost',
    port: 1433,
    pool: {
        max: 6,
        min: 2,
        idleTimeoutMillis: 30000
    },
    options:{
        encrypt: true,
        trustServerCertificate: true
    }
}
export class WWCrepository {
    private static instance: WWCrepository;
    private log: Logger;
    private static globalpool: any;
    private static poolconnector: any;

    private constructor()
    {
        if(WWCrepository.poolconnector==null){
            WWCrepository.poolconnector = new sql.ConnectionPool(poolglobalconfig);
            WWCrepository.globalpool = WWCrepository.poolconnector.connect();
            console.log("Yes");
        }
        this.log = new Logger();
        try
        {
        } catch (e)
        {
            this.log.error(e);
        }
    }

    public static getInstance() : WWCrepository
    {
        if (!this.instance)
        {
            this.instance = new WWCrepository();
        }
        return this.instance;
    }
/*
    public RatingPerMonth(gameMode : string, month:number, player : string, ano: string) : Promise<any>
    {
        const promise = new Promise<string> (
            (resolve, rejects) => {
                var sql = 'CALL  PlayerRatingperMonth (\''+player+'\',\''+gameMode+'\','+month+','+ano+')';
                bdConnection.query(sql, (err:any, rows:any, fields:any) => {
                    
                    if (err){
                        console.log(err);
                        rejects(err.message);
                    }
                    else {
                        
                        resolve(rows);
                    }
                });
            }

        );
        return promise;
    }

    public MatchesPerMonth(gameMode : string, month:number, player : string, ano: string) : Promise<any>
    {
        const promise = new Promise<string> (
            (resolve, rejects) => {
                var sql = 'CALL  MatchesPerMonth (\''+player+'\',\''+gameMode+'\','+month+','+ano+')';
                bdConnection.query(sql, (err:any, rows:any, fields:any) => {
                    
                    if (err){
                        console.log(err);
                        rejects(err.message);
                    }
                    else {
                        resolve(rows);
                    }
                });
            }

        );
        return promise;
    }

    public MatchTracing(nickBlack : string, nickWhite:string, time : string) : Promise<any>
    {
        const promise = new Promise<string> (
            (resolve, rejects) => {
                var sql = 'CALL  MatchTracing (\''+nickWhite+'\',\''+nickBlack+'\',\''+time+'\')';
                bdConnection.query(sql, (err:any, rows:any, fields:any) => {
                    
                    if (err){
                        console.log(err);
                        rejects(err.message);
                    }
                    else {
                        
                        resolve(rows);
                    }
                });
            }

        );
        return promise;
    }

    public FriendList(user : string) : Promise<any>
    {
        const promise = new Promise<string> (
            (resolve, rejects) => {
                var sql = 'CALL FriendList (\''+user+'\')';
                bdConnection.query(sql, (err:any, rows:any, fields:any) => {
                    
                    if (err){
                        console.log(err);
                        rejects(err.message);
                    }
                    else {
                        
                        resolve(rows);
                    }
                });
            }

        );
        return promise;
    }
    
    public PlansPerUser(user : string) : Promise<any>
    {
        const promise = new Promise<string> (
            (resolve, rejects) => {
                var sql = 'CALL PlayerPlans (\''+user+'\')';
                bdConnection.query(sql, (err:any, rows:any, fields:any) => {
                    
                    if (err){
                        console.log(err);
                        rejects(err.message);
                    }
                    else {
                        resolve(rows);
                    }
                });
            }

        );
        return promise;
    }
*/
    public globalRanking() : Promise<any>
    {
        const promise = new Promise<void> (
            (resolve, rejects) => {
                var sql = 'Exec testsp';
                WWCrepository.globalpool.then((pool:any) => {
                    pool.request().query(sql)
                    .then((data: any) =>{
                        resolve()
                    })
                    .catch((err: any)=>{
                        rejects(err.message)
                    })
                })

            }

        );
        return promise;
    }
    public newPost(time : string, email : string ) : Promise<void> 
    {
        // obtener una conexion a la base dee datos
        // hacer el llamado a la base de datos

        const promise = new Promise<void> (
            (resolve, rejects) => {
                var sql = "Exec sp_Post '"+time+"', '"+email+"'";
                console.log(sql);
                WWCrepository.globalpool.then((pool:any) => {
                    pool.request().query(sql)
                    .then((data: any) =>{
                        resolve()
                    })
                    .catch((err: any)=>{
                        rejects(err.message)
                    })
                })

            }

        );
        return promise;
    }
    public newhabit(longitude : number, latitude : number, email : string, title: string, fecha: string  ) : Promise<void> 
    {
        // obtener una conexion a la base dee datos
        // hacer el llamado a la base de datos

        const promise = new Promise<void> (
            (resolve, rejects) => {
                var sql = "Exec sp_Checkin "+longitude+", "+latitude+", '"+email+"', '"+title+"', '"+fecha+"'";
                WWCrepository.globalpool.then((pool:any) => {
                    pool.request().query(sql)
                    .then((data: any) =>{
                        resolve()
                    })
                    .catch((err: any)=>{
                        rejects(err.message)
                    })
                })

            }

        );
        return promise;
    }
    
}
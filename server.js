            

var con = require('./databaseserver');

var express = require("express");


const router = express.Router();
var app = express();
var uname;
var bodyParser = require('body-parser');
app.use('/', router);
app.use(express.static(__dirname + '/public'));
app.use(express.static(__dirname + '/views'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
let cookieParser = require('cookie-parser');
app.set('view engine', 'ejs');
app.use(cookieParser());

//localhost home  page

router.get('/', function (req, res) {
  res.render(__dirname + '/logngpage');
});

router.get('/logngpage', function (req, res) {
  res.render(__dirname + '/logngpage');
});

router.get('/deladmin', function (req, res) {
  res.render(__dirname + '/deladmin');
});

app.post("/loging", function (req, res) {
 
  var username = req.body.username;
  var password = req.body.password;
  uname = username;
 
  var sql1 = "select username from logingdata where username = ? and password= ? ";
  con.query(sql1, [username, password], function (error, result) {
    if (error) console.log(error);
    if (result.length > 0) {
      res.redirect("/postpagepoems");
    } else {
      res.redirect("/");
    }
  });
});

// register page
app.post('/register', function (req, res) {
 
  var username = req.body.username;
  var password = req.body.password;
  var email = req.body.email;
  var phonenumber = req.body.phonenumber;
  var sql = [
    "INSERT INTO userdata(username,password,emailid,phonenumber)VALUES('" + username + "','" + password + "','" + email + "','" + phonenumber + "')",
    "INSERT INTO logingdata(username,password)VALUES('" + username + "','" + password + "')"
  ];
  
  con.query(sql.join(';'), function (error, result) {
    if (error) console.log(error);
   
    res.redirect("/");
  });
});






//post poems page
router.get('/postpagepoems', function (req, res) {
  var sql = [
    "select * from poems",
    "select * from poemcomment",
    "select * from  poemlike",
    "select * from  poemdislike"
   
   
   
    
  ];

  con.query(sql.join(';'), function (error, result) {
    if (error) console.log(error);
   
    res.render(__dirname + "/postpagepoems", { poems : result[0],poemcomment:result[1],poemlike:result[2],poemdislike:result[3]});
  });

});





app.post('/poementring', function (req, res) {
  console.log("poem entraing working properly");
  var poem = req.body.poem;
  var poemname = req.title;
  var sql = "INSERT INTO poems(username,poemname,poem)VALUES('" + uname + "','" + poemname + "','" + poem + "')";
  con.query(sql, function (error, result) {
    if (error) throw error;
    res.redirect("/postpagepoems");

  });
});




//post essay page
router.get('/postessaypage', function (req, res) {
  


  var sql = [
    "select * from essay",
    "select * from essycomment",
    "select * from  essylike",
    "select * from essaydislike"

  
   
    
  ];

  con.query(sql.join(';'), function (error, result) {
    if (error) console.log(error);
   
    res.render(__dirname + "/postessaypage", { essay : result[0],essycomment:result[1],essylike:result[2],essaydislike:result[3]});
  });
});


app.post('/essyentry', function (req, res) {
  console.log("story entraing working properly");
  var essay = req.body.essyentry;
  var essayname = req.body.title;
  var sql = "INSERT INTO essay(username,essayname,essay)VALUES('" + uname + "','" + essayname + "','" + essay + "')";
  con.query(sql, function (error, result) {
    if (error) throw error;
    res.redirect("/postessaypage");
    console.log('essay entaring is sucssess ' + result.insertid);
  });
});





//post shortstory page
router.get('/postshortstorypage', function (req, res) {
  var sql = [
    "select * from shortstory",
    "select * from shortstorycomment",
    "select * from  shortstorylike",
    "select * from  shortstorydislike"
   
   
  ];

  con.query(sql.join(';'), function (error, result) {
    if (error) console.log(error);
   
    res.render(__dirname + "/postshortstorypage", { shortstory : result[0],shortstorycomment:result[1],shortstorylike:result[2],shortstorydislike:result[3]});
  });
});


app.post('/shortstoriesentry', function (req, res) {
  console.log("story entraing working properly");
  var shortstory = req.body.shortstory;
  var shortstoryname = req.body.title;
  var sql = "INSERT INTO shortstory(username,shortstoryname,shortstory)VALUES('" + uname + "','" + shortstoryname + "','" + shortstory + "')";
  con.query(sql, function (error, result) {
    if (error) throw error;
    res.redirect("/postshortstorypage");
    console.log('shortstory entaring is sucssess ' + result.insertid);
  });
});

//post comment of poems

app.post('/poemscomment', function (req, res) {
  
  var postid = req.body.postid;
  var comment = req.body.comment;
  var sql = "INSERT INTO poemcomment(username,postid,comment)VALUES('" + uname + "','" + postid + "','" + comment + "');";
 
  con.query(sql,function (error, result) {
    
    if (error) throw error;
    res.redirect("/postpagepoems");
    });
  });

//post comment of essay

app.post('/essaycomment', function (req, res) {
  
  var postid = req.body.postid;
  var comment = req.body.comment;
 
  var sql = "INSERT INTO essycomment(username,postid,comment)VALUES('" + uname + "','" + postid + "','" + comment + "');";
 
  con.query(sql,function (error, result) {
    
    if (error) throw error;
    res.redirect("/postessaypage");
    });
  });



  //comment short story

  app.post('/shortstorycomment', function (req, res) {
  
    var postid = req.body.postid;
    var comment = req.body.comment;
    console.log(comment);
    var sql = "INSERT INTO shortstorycomment(username,postid,comment)VALUES('" + uname + "','" + postid + "','" + comment + "');";
   
    con.query(sql,function (error, result) {
      
      if (error) throw error;
      res.redirect("/postshortstorypage");
      });
    });
  

    //likepoem

    app.post('/poemslike', function (req, res) {
  
      var postid = req.body.postid;
     
      var sql = "INSERT INTO poemlike (poemid,username)VALUES('" + postid + "','" + uname + "');";
     
      con.query(sql,function (error, result) {
        
        if (error) throw error;
        res.redirect("/postpagepoems");
        });
      });
     
    //dislikepoem

    app.post('/poemsdislike', function (req, res) {
  
      var postid = req.body.postid;
    
      
      var sql = "INSERT INTO poemdislike(poemid,username)VALUES('" + postid + "','" + uname + "');";
     
      con.query(sql,function (error, result) {
        
        if (error) throw error;
        res.redirect("/postpagepoems");
        });
      });
    

       //likeessy

    app.post('/essylike', function (req, res) {
  
      var postid = req.body.postid;
    
      
      var sql = "INSERT INTO essylike (essyid,username)VALUES('" + postid + "','" + uname + "');";
     
      con.query(sql,function (error, result) {
        
        if (error) throw error;
        res.redirect("/postessaypage");
        });
      });

      
    //dislikessy



    app.post('/essydislike', function (req, res) {
  
      var postid = req.body.postid;
    
   
     
      var sql = "INSERT INTO essaydislike (essayid,username)VALUES('" + postid + "','" + uname + "');";
      con.query(sql,[uname,postid],function (error, result) {
       
      
       
          cres.redirect("/postessaypage");
         
      
    });

    

  });
    
  //likeshortstory

  app.post('/shortstorylike', function (req, res) {
  
    var postid = req.body.postid;
  
    
    var sql = "INSERT INTO shortstorylike(shortstoryid,username)VALUES('" + postid + "','" + uname + "');";
   
    con.query(sql,function (error, result) {
      
      if (error) throw error;
      res.redirect("/postshortstorypage");
      });
    });

    
  //dislikshortstory

  app.post('/shortstorydislike', function (req, res) {

    var postid = req.body.postid;
     
      
     
      var sql = "INSERT INTO shortstorydislike(shortstoryid,username)VALUES('" + postid + "','" + uname + "');";
   
    con.query(sql,function (error, result) {
      
      if (error) throw error;
      res.redirect("/postshortstorypage");
      });
    });

//updatepoems

app.post('/uppoem', function (req, res) {
  
  var postid = req.body.postid;
  var poem = req.body.entry;
  var poemname = req.body.title;
 

  var sql = "UPDATE  poems set username=? ,poemname=?, poem=?  where poemid=?;";
  con.query(sql,[uname,poemname,poem,postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});


//delete poem page

app.post('/delepoem', function (req, res) {
  
  var postid = req.body.postid;
  
 
 
  var sql =  "DELETE FROM poems WHERE  poemid=?;";
  con.query(sql,[postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});



//delete comments page

app.post('/delcomment', function (req, res) {
  
  var postid = req.body.postid;
  
 
 
  var sql =  "DELETE FROM poemcomment WHERE  commentid=?;";
  con.query(sql,[postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});


//update short stories


app.post('/upshortstories', function (req, res) {
  
  var postid = req.body.postid;
  var shortstorie = req.body.entry;
  var shortstorename = req.body.title;
 

  var sql = "UPDATE shortstory set username=? ,shortstoryname=?,shortstory=?  where shortstoryid=?;";
  con.query(sql,[uname,shortstorename,shortstorie,postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});


//delete stories page 

app.post('/delstories', function (req, res) {
  
  var postid = req.body.postid;
  
 
 
  var sql =  "DELETE FROM shortstory WHERE  shortstoryid=?;";
  con.query(sql,[postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});



//delete comments page

app.post('/delshortstorycomment', function (req, res) {
  
  var postid = req.body.postid;
  
 
 
  var sql =  "DELETE FROM shortstorycomment WHERE  commentId=?;";
  con.query(sql,[postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});




//update essay


app.post('/upessay', function (req, res) {
  
  var postid = req.body.postid;
  var essay = req.body.entry;
  var essayname = req.body.title;
 

  var sql = "UPDATE essay set username=? ,essayname=?,essay=?  where essayid=?;";
  con.query(sql,[uname,essayname,essay,postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});


//delete essay 

app.post('/delessay', function (req, res) {
  
  var postid = req.body.postid;
  
 
 
  var sql =  "DELETE FROM essay WHERE  essayid=?;";
  con.query(sql,[postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});



//delete comments page

app.post('/delcomment', function (req, res) {
  
  var postid = req.body.postid;
  
 
 
  var sql =  "DELETE FROM essycomment WHERE  commentid=?;";
  con.query(sql,[postid], function (error, result) {
    if (error) throw error;
    res.redirect("/deladmin");

  });
});




  


app.listen(8080);



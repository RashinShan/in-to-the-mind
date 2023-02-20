
create database intothemind;
use intothemind;
CREATE TABLE `currentuser` (
  `userId` int(11) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `essay` (
  `username` varchar(100) NOT NULL,
  `essayid` int(11) NOT NULL,
  `essayname` varchar(100) NOT NULL,
  `essay` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `essay` (`username`, `essayid`, `essayname`, `essay`) VALUES
('RashinShan', 1, 'gghh', 'sdfsdfsdf'),
('RashinShan', 2, 'sfsdfsdf', 'sdfsdfsdfsdf'),
('undefined', 3, 'my home', 'my beauty full home'),
('undefined', 4, '', ''),
('RashinShan', 5, 'my friend', 'ffsfasf'),
('RashinShan', 6, 'my hart', 'ddfhfh'),
('RashinShan', 7, 'my world', 'my world is sooo buteful');



CREATE TABLE `essaydislike` (
  `essayid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `essycomment` (
  `commentid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `postid` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `essycomment` (`commentid`, `username`, `postid`, `comment`) VALUES
(8, 'RashinShan', 1, 'nice'),
(9, 'RashinShan', 5, 'good');


CREATE TABLE `essylike` (
  `essyid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `logingdata` (
  `userId` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `logingdata` (`userId`, `username`, `password`) VALUES
(1, 'RashinShan', 'Shan1234'),
(2, 'RashinShan', 'Shan1234'),
(3, 'acmer', 'aaa'),
(4, 'lahiru', 'lahi99');


CREATE TABLE `poemcomment` (
  `commentid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `postid` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `poemcomment` (`commentid`, `username`, `postid`, `comment`) VALUES
(1, 'RashinShan', 1, 'good'),
(2, 'RashinShan', 4, 'good you can do it better'),
(3, 'undefined', 2, 'kitty cat'),
(4, 'undefined', 1, 'good boy'),
(5, 'RashinShan', 1, 'fdsfsfdsdfdf'),
(6, 'RashinShan', 3, 'nice'),
(7, 'lahiru', 2, 'very nice aa'),
(8, 'undefined', 1, ''),
(9, 'RashinShan', 5, 'nice'),
(10, 'RashinShan', 4, 'nice'),
(11, 'undefined', 10, 'yes your mind is true'),
(12, 'undefined', 1, 'jklkjlkj'),
(13, 'undefined', 1, 'hhhh'),
(14, 'RashinShan', 1, 'ghfgh'),
(15, 'RashinShan', 1, 'kkh');


CREATE TABLE `poemdislike` (
  `poemid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `poemlike` (
  `poemid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `poems` (
  `username` varchar(100) NOT NULL,
  `poemid` int(11) NOT NULL,
  `poemname` varchar(100) NOT NULL,
  `poem` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `poems` (`username`, `poemid`, `poemname`, `poem`) VALUES
('RashinShan', 1, 'in to the mind', 'my mind oh my mind,\r\ni like you soo much,\r\nwhen it is deram,\r\nyou go away.'),
('Dinukadulanjana', 2, 'song', 'my dear hart,\r\ni like you soo much,\rounce upone a time,\r\nyou go away.'),
('undefined', 3, '', 'whats on your mindi love you'),
('RashinShan', 4, '', 'penne ooo penne un parwei naan mayangei vettei'),
('RashinShan', 5, 'undefined', 'white flowers are so butyful'),
('RashinShan', 9, 'undefined', 'dfbfdbdfbdf'),
('undefined', 10, 'true', 'my mind is true');


CREATE TABLE `shortstory` (
  `username` varchar(100) NOT NULL,
  `shortstoryid` int(11) NOT NULL,
  `shortstoryname` varchar(100) NOT NULL,
  `shortstory` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `shortstory` (`username`, `shortstoryid`, `shortstoryname`, `shortstory`) VALUES
('RashinShan', 1, 'undefined', 'madolduuwa is a story about village'),
('RashinShan', 2, 'undefined', 'amma is a book about russiyen '),
('RashinShan', 3, 'kiss', 'a kiss is a rose like a night blossemd flower'),
('undefined', 4, 'k', 'hhjj'),
('RashinShan', 5, 'jjkk', 'kjnkkbjjkbb');



CREATE TABLE `shortstorycomment` (
  `commentId` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `postid` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `shortstorycomment` (`commentId`, `username`, `postid`, `comment`) VALUES
(1, 'undefined', 1, 'undefined'),
(2, 'RashinShan', 1, 'undefined'),
(3, 'undefined', 1, 'undefined'),
(4, 'undefined', 1, 'undefined'),
(5, 'undefined', 1, 'fghjfgh'),
(6, 'RashinShan', 1, 'gvngn'),
(7, 'RashinShan', 1, 'nvnvgnv');



CREATE TABLE `shortstorydislike` (
  `shortstoryid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `shortstorylike` (
  `shortstoryid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `userdata` (
  `userId` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `userdata` (`userId`, `username`, `password`, `emailid`, `phonenumber`) VALUES
(1, 'kamal', 'kamal123', 'kamal@gmail.com', '0772344156'),
(2, 'Rashin Shan', 'shan1234', 'shan@gmail.com', '0743234556'),
(3, 'kernal', 'kernal123', 'kernal@gmail.com', '0786657896'),
(4, 'kernal', 'kernal123', 'kernal@gmail.com', '0786657896'),
(5, 'kernal', 'kernal123', 'kernal@gmail.com', '0786657896'),
(6, '2018/ICTS/12', 'kkll', '2018@gmail.com', '0712234568'),
(7, '2018/ICTS/12', 'kkll', '2018@gmail.com', '0712234568'),
(8, 'kanthi', 'kanthi1', 'kanthi@gmail.com', '0788403919'),
(9, 'kamal2', 'kamal1233', 'kamal2@gmail.com', '07728964156'),
(10, 'kamal5', '22345', 'df@gmail.com', '0713345678'),
(11, 'pasindu', '2234', 'pasidu@gmail.com', '0773356721'),
(17, 'q', 'w', 'w@gmail.com', '01178665473'),
(18, 'T janani', 'janani rashin shan', 'janani@gmail.com', '077654234'),
(19, 'kaakaneela', '1234', 'kaakaneela@gmail.com', '0776544312'),
(20, 'p', 's', 's@gamil.com', '09987'),
(21, 'kkk', 'ppp', 'kp@gmail.com', '099876542'),
(22, 'moc', 'mocvv', 'moc@gmail.com', '078665423'),
(23, 'anubu', 'anbu@123', 'anbu@gmail.com', '08766565423'),
(24, 'minus', '0000', 'minus@gmail.com', '9987'),
(25, 'kasun', 'kasun', 'k@gmai.com', '0712234568'),
(26, 'vika', 'vika123', 'v@gmail.com', '00998'),
(28, 'ncyapa', 'nc1234', 'nc@gmail.com', '567457467'),
(29, 'acmer', 'aaa', 'a@gmail.com', '436346456'),
(30, 'lahiru', 'lahi99', 'lahiru999@gmail.com', '0716516444'),
(31, 'Pramod', 'Jayansiri', 'Pramodsithara9999@gmail.com', '0786966129'),
(32, 'Sithara', '123', 'Pramodsithara9999@gmail.com', '0786966129');

ALTER TABLE `currentuser`
  ADD PRIMARY KEY (`userId`);

ALTER TABLE `essay`
  ADD PRIMARY KEY (`essayid`);


ALTER TABLE `essaydislike`
  ADD PRIMARY KEY (`count`);

ALTER TABLE `essycomment`
  ADD PRIMARY KEY (`commentid`);


ALTER TABLE `logingdata`
  ADD PRIMARY KEY (`userId`);

ALTER TABLE `poemcomment`
  ADD PRIMARY KEY (`commentid`);


ALTER TABLE `poemdislike`
  ADD PRIMARY KEY (`count`);

ALTER TABLE `poemlike`
  ADD PRIMARY KEY (`count`);

ALTER TABLE `poems`
  ADD PRIMARY KEY (`poemid`);

ALTER TABLE `shortstory`
  ADD PRIMARY KEY (`shortstoryid`);

ALTER TABLE `shortstorycomment`
  ADD PRIMARY KEY (`commentId`);

ALTER TABLE `shortstorydislike`
  ADD PRIMARY KEY (`count`);

ALTER TABLE `userdata`
  ADD PRIMARY KEY (`userId`);


ALTER TABLE `essay`
  MODIFY `essayid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `essaydislike`
  MODIFY `count` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `essycomment`
  MODIFY `commentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `logingdata`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `poemcomment`
  MODIFY `commentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;


ALTER TABLE `poemdislike`
  MODIFY `count` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `poemlike`
  MODIFY `count` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `poems`
  MODIFY `poemid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `shortstory`
  MODIFY `shortstoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `shortstorycomment`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `shortstorydislike`
  MODIFY `count` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `userdata`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

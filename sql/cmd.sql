# Create user table
CREATE TABLE `user` (
    uid int(11) AUTO_INCREMENT NOT null,
    username varchar(20) not null,
    email varchar(50) not null,
    password varchar(20) not null,
    groupid int(11) not null,
    PRIMARY KEY (uid),
    UNIQUE username(username),
    UNIQUE email(email),
    UNIQUE uid(uid),
    registertime DATETIME NOT null
);

# Create group table
CREATE TABLE `group` (
    gid int(11) NOT null,
    UNIQUE gid(gid),
    PRIMARY KEY (gid),
    premission_admin boolean NOT null,
    premission_submit boolean NOT null,
    premission_discuss boolean NOT null
);

# Create user status table
CREATE TABLE `userstatus` (
    uid int(11) NOT null,
    PRIMARY KEY (uid),
    UNIQUE uid (uid),
    submit mediumtext NOT null,
    accepted mediumtext NOT null
);
CREATE TABLE `userprofile` (
    uid int(11) NOT null,
    PRIMARY KEY (uid),
    UNIQUE uid (uid),
    submit int(11) NOT null,
    accepted int(11) NOT null,
    score int(11) NOT null,
    avatar text not null,
    registertime DATETIME not null,
    lastactive DATETIME not null
);


# Create problemset table
CREATE TABLE `problemset` (
    pid int(11) NOT null AUTO_INCREMENT,
    PRIMARY KEY (pid),
    UNIQUE pid(pid),
    title text not null,
    source text not null
);

# Create problem status table
CREATE TABLE `problemstatus` (
    pid int(11) NOT null,
    PRIMARY KEY (pid),
    UNIQUE (pid),
    submit int (11) NOT null,
    accepted int (11) NOT null
);

# Create problem detail table
CREATE TABLE `problemdetail` (
    pid int(11) NOT null,
    PRIMARY KEY (pid),
    UNIQUE pid(pid),
    description mediumtext NOT null,
    input mediumtext NOT null,
    output mediumtext NOT null,
    sampleinput mediumtext NOT null,
    sampleoutput mediumtext NOT null,
    hint mediumtext NOT null,
    title text NOT null,
    source text NOT null
);

# Create Status table
CREATE TABLE `status` (
    sid int(11) NOT null AUTO_INCREMENT,
    PRIMARY KEY (sid),
    UNIQUE sid(sid),
    pid int(11) not null,
    uid int(11) not null,
    lang int(11) not null,
    submittime DATETIME not null,
    path text not null,
    status int(11) not null,
    memory int(11) not null,
    time int(11) not null,
    codelength int(11) not null
);

# Create Discuss table
CREATE TABLE `discuss` (
    did int(11) NOT null AUTO_INCREMENT,
    PRIMARY KEY (did),
    UNIQUE did(did),
    pid int(11) not null,
    uid int(11) not null,
    submittime DATETIME not null,
    title text not null
);

CREATE TABLE `discussdetail` (
    did int(11) NOT null,
    tid int(11) NOT null AUTO_INCREMENT,
    PRIMARY KEY (tid),
    UNIQUE did(did),
    UNIQUE tid(tid),
    uid int(11) not null,
    submittime DATETIME not null,
    title text not null,
    detail mediumtext not null
);

#Create Direct Message Table
CREATE TABLE `directmessage` (
    dmid int(11) NOT null AUTO_INCREMENT,
    suid int(11) NOT null,
    ruid int(11) NOT null,
    PRIMARY KEY (suid, ruid),
    UNIQUE dmid(dmid),
    message text NOT null
);

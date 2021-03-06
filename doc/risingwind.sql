USE [master]
GO
/****** Object:  Database [risingwindbbs]    Script Date: 2017/11/23 22:47:01 ******/
CREATE DATABASE [risingwindbbs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'risingwindbbs', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\risingwindbbs.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'risingwindbbs_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\risingwindbbs_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [risingwindbbs] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [risingwindbbs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [risingwindbbs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [risingwindbbs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [risingwindbbs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [risingwindbbs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [risingwindbbs] SET ARITHABORT OFF 
GO
ALTER DATABASE [risingwindbbs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [risingwindbbs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [risingwindbbs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [risingwindbbs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [risingwindbbs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [risingwindbbs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [risingwindbbs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [risingwindbbs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [risingwindbbs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [risingwindbbs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [risingwindbbs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [risingwindbbs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [risingwindbbs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [risingwindbbs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [risingwindbbs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [risingwindbbs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [risingwindbbs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [risingwindbbs] SET RECOVERY FULL 
GO
ALTER DATABASE [risingwindbbs] SET  MULTI_USER 
GO
ALTER DATABASE [risingwindbbs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [risingwindbbs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [risingwindbbs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [risingwindbbs] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [risingwindbbs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'risingwindbbs', N'ON'
GO
USE [risingwindbbs]
GO
/****** Object:  Table [dbo].[Tbl_Admin]    Script Date: 2017/11/23 22:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Admin](
	[adminNum] [int] IDENTITY(1000,1) NOT NULL,
	[adminstrator] [varchar](15) NULL,
	[supervisorPassword] [varchar](15) NULL,
	[loginCount] [int] NULL,
	[ipaddress] [nvarchar](50) NULL,
	[loginTime] [datetime] NULL,
	[oldLoginTime] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Admin] PRIMARY KEY CLUSTERED 
(
	[adminNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Forums]    Script Date: 2017/11/23 22:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Forums](
	[forumId] [int] IDENTITY(1,1) NOT NULL,
	[forumTitle] [varchar](15) NULL,
	[forumInfo] [nvarchar](50) NULL,
	[forumPic] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Forums] PRIMARY KEY CLUSTERED 
(
	[forumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Pic]    Script Date: 2017/11/23 22:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Pic](
	[picId] [int] IDENTITY(1,1) NOT NULL,
	[postId] [int] NULL,
	[picName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Post]    Script Date: 2017/11/23 22:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Post](
	[postId] [int] IDENTITY(1,1) NOT NULL,
	[forumId] [int] NULL,
	[UID] [int] NULL,
	[postTitle] [nvarchar](50) NULL,
	[postContent] [ntext] NULL,
	[postTime] [datetime] NULL,
	[pageViews] [int] NULL,
	[regen] [int] NULL,
	[pic] [nvarchar](50) NULL CONSTRAINT [DF_Tbl_Post_pic]  DEFAULT (N'pic_post/default.png'),
 CONSTRAINT [PK_Tbl_Post] PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Reply]    Script Date: 2017/11/23 22:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Reply](
	[replyId] [int] IDENTITY(1,1) NOT NULL,
	[postId] [int] NULL,
	[floor] [int] NULL,
	[userId] [int] NULL,
	[replyUser] [nvarchar](50) NULL,
	[replyContent] [ntext] NULL,
	[replyTime] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Reply] PRIMARY KEY CLUSTERED 
(
	[replyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_User]    Script Date: 2017/11/23 22:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_User](
	[UID] [int] IDENTITY(1000,1) NOT NULL,
	[password] [nvarchar](50) NULL,
	[userName] [nvarchar](50) NULL,
	[phoneNum] [nvarchar](50) NULL,
	[qqNum] [int] NULL,
	[email] [nvarchar](30) NULL,
	[sex] [nchar](10) NULL,
	[birthday] [date] NULL,
	[address] [nvarchar](50) NULL,
	[headPortrait] [varchar](50) NULL CONSTRAINT [DF_Tbl_User_headPortrait]  DEFAULT ('pic_user/default.jpg'),
	[qianming] [nvarchar](50) NULL,
	[registrationTime] [datetime] NULL,
	[registerIP] [nvarchar](50) NULL,
	[signInNum] [int] NULL,
	[signInPoints] [int] NULL,
	[empiricValue] [int] NULL,
	[grade] [int] NULL,
	[positi] [varchar](50) NULL,
	[ipAddress] [nvarchar](50) NULL,
	[loginTime] [datetime] NULL,
	[oldLoginTime] [datetime] NULL,
 CONSTRAINT [PK_Tbl_User] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Admin] ON 

INSERT [dbo].[Tbl_Admin] ([adminNum], [adminstrator], [supervisorPassword], [loginCount], [ipaddress], [loginTime], [oldLoginTime]) VALUES (1000, N'admin', N'admin', 1, N'116.252.154.0 -- 广西壮族自治区南宁市', CAST(N'2017-11-23 22:00:22.000' AS DateTime), NULL)
INSERT [dbo].[Tbl_Admin] ([adminNum], [adminstrator], [supervisorPassword], [loginCount], [ipaddress], [loginTime], [oldLoginTime]) VALUES (1001, N'root', N'root', 1, N'116.252.154.0 -- 广西壮族自治区南宁市', CAST(N'2017-11-23 22:00:22.000' AS DateTime), NULL)
INSERT [dbo].[Tbl_Admin] ([adminNum], [adminstrator], [supervisorPassword], [loginCount], [ipaddress], [loginTime], [oldLoginTime]) VALUES (1002, N'1234', N'1234', 1, N'116.252.154.0 -- 广西壮族自治区南宁市', CAST(N'2017-11-23 22:00:22.000' AS DateTime), NULL)
INSERT [dbo].[Tbl_Admin] ([adminNum], [adminstrator], [supervisorPassword], [loginCount], [ipaddress], [loginTime], [oldLoginTime]) VALUES (1003, N'340112800', N'340112800', 1, N'116.252.154.0 -- 广西壮族自治区南宁市', CAST(N'2017-11-23 22:00:22.000' AS DateTime), NULL)
INSERT [dbo].[Tbl_Admin] ([adminNum], [adminstrator], [supervisorPassword], [loginCount], [ipaddress], [loginTime], [oldLoginTime]) VALUES (1009, N'1', N'1', 13, N'116.252.154.0 -- 广西壮族自治区南宁市', CAST(N'2017-11-23 22:15:02.000' AS DateTime), NULL)
INSERT [dbo].[Tbl_Admin] ([adminNum], [adminstrator], [supervisorPassword], [loginCount], [ipaddress], [loginTime], [oldLoginTime]) VALUES (1010, N'2', N'2', 2, N'116.252.154.0 -- 广西壮族自治区南宁市', CAST(N'2017-11-23 22:00:22.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Admin] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Forums] ON 

INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (1, N'灌者为王', N'聊聊天，说个笑话，讲一段故事', N'gzww.png')
INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (2, N'极客播报', N'极客天地，为你透析世间万象', N'jkbb.png')
INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (3, N'活动专区', N'新品福利送不停', N'hdzq.png')
INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (4, N'软件', N'每天为你提供丰富的APP资源', N'rj.png')
INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (5, N'壁纸', N'风景、人物、卡通、应有尽有', N'bz.png')
INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (6, N'游戏', N'炫酷的游戏资源，都在这里', N'yx.png')
INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (8, N'汉化资源', N'汉化爱好者聚集地，我们为汉化而生', N'hhzy.png')
INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (9, N'BUG反馈', N'每一条反馈，我们都视若珍宝', N'bugfk.png')
INSERT [dbo].[Tbl_Forums] ([forumId], [forumTitle], [forumInfo], [forumPic]) VALUES (10, N'投诉处理', N'违规处理公示栏，伸张正义好去处', N'tscl.png')
SET IDENTITY_INSERT [dbo].[Tbl_Forums] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Pic] ON 

INSERT [dbo].[Tbl_Pic] ([picId], [postId], [picName]) VALUES (1, NULL, N'pic_nav/1.jpg')
INSERT [dbo].[Tbl_Pic] ([picId], [postId], [picName]) VALUES (2, NULL, N'pic_nav/2.jpg')
INSERT [dbo].[Tbl_Pic] ([picId], [postId], [picName]) VALUES (3, 11, N'pic_nav/3.png')
INSERT [dbo].[Tbl_Pic] ([picId], [postId], [picName]) VALUES (7, 11, N'7.jpg')
INSERT [dbo].[Tbl_Pic] ([picId], [postId], [picName]) VALUES (8, 11, N'54.jpg')
INSERT [dbo].[Tbl_Pic] ([picId], [postId], [picName]) VALUES (9, 76, N'IOT.jpg')
SET IDENTITY_INSERT [dbo].[Tbl_Pic] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Post] ON 

INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (10, 1, 1003, N'红米note4X标准版', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">红米note4x标准版手机能够从</span><br/><span style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); cursor: pointer;">MIUI</span><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">9开发版 升级回MIUI9稳定版吗</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">可以的话麻烦发送【红米note4x标准版】的MIUI9稳定版给我</span>
</p>', CAST(N'2018-02-09 00:00:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (11, 4, 1007, N'Android抓TCPDump', N'<p>
    1.开发版手机开启root权限
安全中心-授权管理-ROOT权限管理（如果失败，请检查手机已登陆小米帐号/手机解锁）
</p>
<p>
    &nbsp;2.下载tcpdump（百度云盘）
http://pan.baidu.com/s/1dE0FLEL
</p>
<p>
    &nbsp;3.adb push 电脑中tcpdump的目录 /data/local/tcpdump
</p>
<p>
    &nbsp;4.adb shell后Enter
 &nbsp; 键入chmod 755 /data/local/tcpdump后Enter&nbsp;
</p>
<p>
    &nbsp;&nbsp; 键入su - root后Enter
 &nbsp;
</p>
<p>
    &nbsp;键入cd /data/local后Enter&nbsp;
</p>
<p>
    &nbsp;&nbsp; 键入tcpdump -i any -p -s 0 -w /sdcard/capture.pcap后Enter&nbsp;
</p>
<p>
    &nbsp;&nbsp; 开始抓包
 &nbsp; 命令参数：
 &nbsp; &nbsp; &nbsp;
</p>
<p>
    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# &quot;-i any&quot;: listen on any network interface
　
</p>
<p>
    　 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # &quot;-p&quot;: disable promiscuous mode (doesn&#39;t work anyway)
　　 &nbsp;&nbsp;
</p>
<p>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # &quot;-s 0&quot;: capture the entire packet
　　 &nbsp;&nbsp;
</p>
<p>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # &quot;-w&quot;: write packets to a file (rather than printing to stdout)
　
</p>
<p>
    　 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ... do whatever you want to capture, then ^C to stop it ...&nbsp;
</p>
<p>
    5.问题复现后，同时按Ctrl+C 停止抓包；键入exit后按Enter退出
</p>
<p>
    6.adb pull /sdcard/capture.pcap D: &nbsp;生成的文件输出到电脑D盘
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (17, 2, 1011, N'圈铁耳机Pro线控无效', N'<p class=p  style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:21.0000pt;padding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;text-align:left;line-height:18.0000pt;" ><span style="mso-spacerun:''yes'';font-family:微软雅黑;color:rgb(68,68,68);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:8.0000pt;mso-font-kerning:0.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" >2017年7月26日，小米在北京国家会议中心举行</span><span style="mso-spacerun:''yes'';font-family:微软雅黑;color:rgb(68,68,68);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:8.0000pt;mso-font-kerning:0.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" >MIUI&小米新品发布会，洪锋在会上向大家介绍了快如闪电的&nbsp;MIUI&nbsp;9，并于发布会第二天7月27日开启了开发版内测。经过两个多月的深度优化，</span><b><span class="16"  style="mso-spacerun:''yes'';font-family:微软雅黑;color:rgb(68,68,68);letter-spacing:0.0000pt;font-weight:bold;text-transform:none;font-style:normal;font-size:8.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" >MIUI&nbsp;9首批机型稳定版将于10月31日上午11点推送&nbsp;OTA&nbsp;更新</span></b><span style="mso-spacerun:''yes'';font-family:微软雅黑;color:rgb(68,68,68);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:8.0000pt;mso-font-kerning:0.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="微软雅黑" >，支持从</font>&nbsp;MIUI&nbsp;8稳定版直接&nbsp;OTA&nbsp;升级到&nbsp;MIUI&nbsp;9。喜欢手动刷机的发烧友，也可以前下载完整包手动刷机升级</span><span style="mso-spacerun:''yes'';font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:''Times New Roman'';font-size:12.0000pt;mso-font-kerning:0.0000pt;" ><o:p></o:p></span></p><p class=MsoNormal  style="margin-bottom:12.0000pt;mso-pagination:widow-orphan;text-align:left;" ><span style="mso-spacerun:''yes'';font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:''Times New Roman'';font-size:10.5000pt;mso-font-kerning:1.0000pt;" ><o:p>&nbsp;</o:p></span></p><p class=p  style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:21.0000pt;padding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;text-align:left;line-height:18.0000pt;background:rgb(255,255,255);" ><b><span class="16"  style="mso-spacerun:''yes'';font-family:微软雅黑;color:rgb(68,68,68);letter-spacing:0.0000pt;font-weight:bold;text-transform:none;font-style:normal;font-size:8.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="微软雅黑" >我们希望能够给予米粉们更好的系统体验，所以本次</font>&nbsp;MIUI&nbsp;9稳定版将以分批次发布的形式，首批机型已于10月31日上午11:00开始推送&nbsp;OTA&nbsp;更新，其余机型将会在准备完毕后陆续推送更新，我们将全力以赴，争取尽快全部发出。</span></b><span style="mso-spacerun:''yes'';font-family:微软雅黑;color:rgb(68,68,68);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:8.0000pt;mso-font-kerning:0.0000pt;" ><o:p></o:p></span></p><p class=MsoNormal ><span style="mso-spacerun:''yes'';font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:''Times New Roman'';font-size:10.5000pt;mso-font-kerning:1.0000pt;" >', CAST(N'2017-09-05 00:00:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (18, 3, 1015, N'miui9稳定版本能一直保持稳定的“快如闪电”吗', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">手上米5最近升级了miui9稳定版，流畅度确实很好。而我更想知道，这种流畅度能保持多久？如何保持？能不能打破安卓系统越用越卡的命运？我本人的手机没有运行大型游戏，也没有装很多的应用，也经常清理手机垃圾。可总觉得，快如闪电的miui9还是经常性的卡顿。难道是我的硬件老化了吗？已经买了一年了</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">我想征求更多的系统优化的方法，希望我的米5再撑多一年。。。</span>
</p>', CAST(N'2017-03-05 00:00:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (19, 4, 1017, N'【快如闪电】MIUI 9稳定版 正在开放升级 已支持18款小米手机', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">2017年7月26日，小米在北京国家会议中心举行</span><span style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255); cursor: pointer;">MIUI</span><span style="color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">&amp;小米新品发布会，洪锋在会上向大家介绍了快如闪电的 MIUI 9，并于发布会第二天7月27日开启了开发版内测。经过两个多月的深度优化，</span><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">MIUI 9首批机型稳定版将于10月31日上午11点推送 OTA 更新</span><span style="color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">，支持从 MIUI 8稳定版直接 OTA 升级到 MIUI 9。</span>
</p>', CAST(N'2017-10-31 00:00:00.000' AS DateTime), 1, 1, N'pic_post/20.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (20, 2, 1018, N'【小白终结帖】入门开发者必备学习资料大集合', N'<p>
    <span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);"><span style="font-size:18px">好吧，其实我只是想给大家分享一些安卓开发入门的书籍，开发版刚开版不久，而大多数的版友也多是对安卓开发比较陌生，因此版主特地收集了一些关于安卓的书籍，大家有空可以一起学习学习，不过虽然看书可以比较系统全面的了解安卓开发，但是经常上论坛和版友交流才可以更好的掌握喔~</span></span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (21, 1, 1019, N'那些年多看阅读做过的启动图', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: medium; background-color: rgb(255, 255, 255);">2012年，多看阅读 for kindle上线，我们的设计师做了一系列有“温度”的kindle屏保“二十四节气系列”、“珍稀动物系列”，他的初衷是用户在使用kindle时能感到变化，而不是“永远一样的启动图”或是“五花八门的广告“。这系列壁纸一直延续至今，深受众多书友的喜爱。</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 2, N'pic_post/6.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (22, 2, 1020, N'多看书币活动中小米贷款的币领不了', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">已经完成小米贷款认证，并且有过一次贷款了，目前在多看App里还是不能领取书币。</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (23, 3, 1021, N'【米粉大轰趴】科普小米公司冷知识，还有冬日暖心礼包拿', N'<p>
    <span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: medium; background-color: rgb(255, 255, 255);"><span style="color:Red">活动内容：</span></span><br/><span style="color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: medium; background-color: rgb(255, 255, 255);">分享一个你所知道的关于小米公司的冷知识即可。</span><br/><span style="color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: medium; background-color: rgb(255, 255, 255);">可以是MIUI 产品功能的，可以是生态链产品归属的，只要够冷就行。</span><br/><br/><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: medium; background-color: rgb(255, 255, 255);">例如：</span><br/><span style="color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: medium; background-color: rgb(255, 255, 255);">小米公司的logo倒着看像少了一点的“心”字，取意让用户少操一点心</span><br/><br/><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: medium; background-color: rgb(255, 255, 255);"><span style="color:Red">活动时间：</span></span><br/><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: medium; background-color: rgb(255, 255, 255);">11.17-11.19</span><br/><br/><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: medium; background-color: rgb(255, 255, 255);"><span style="color:Red">活动奖品：</span></span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (24, 4, 1022, N'【划重点】额度清零怎么办？', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">各位亲亲好，版主和大家认识的时间也不短了，这段时间看到的最多的问题就是——</span><span style="font-size:16px"><em style="word-wrap: break-word;"><span style="text-decoration:underline;">为什么我的额度被清零了？？？</span></em></span><br/><br/><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">是呢，作为有贷款需求的亲亲来说，额度被清零确实会对个人产生较大的影响。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">所以究竟为什么会被额度清零？版主今天就来说一说。</span><br/><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">首先，小米贷款作为小米官方出品的金融类产品，是绝对安全可靠的，这点大家大可放心。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">对于额度清零的现象，属于个例，只出现在极少的用户身上。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">下面就来为大家详细解读下额度清零的问题。</span><br/><br/><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">首先说一下，额度被清零的亲亲的判定标准——风险值。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">之前版主给大家回复时，也会告诉大家，“系统在发现用户存在风险时，会暂停额度”。</span><br/><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">那么所谓的风险是什么呢？</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">当然就是有可能不还款咯。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">作为一个借贷平台，肯定要保证贷出去的钱可以回来，才会将钱贷出去啊。这点相信大家都会理解。</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (25, 5, 1023, N'评估信用分时登录不了信用卡账单邮箱的看过来', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">最近有很多同学反馈想要刷一下信用分的时候，却悲催的发现没办法添加自己的邮箱，只好干着急。有些比较友好的邮箱轻轻松就登录了，Gmail这种大神不翻墙请不来，而经常有人毫无防备的栽在QQ和网易邮箱这两位安全策略比较复杂的大户身上。</span><br/><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">整理了QQ/163/126邮箱在第三方客户端登录的方式，传送门如下：</span><br/><br/><span style="font-family:Microsoft Yahei, Hei, Tahoma, SimHei, sans-serif"><span style="color:#000000"><span style=""><span style="word-wrap: break-word; font-weight: 700;">登录不了信用卡账单邮箱的看过来——QQ邮箱设置方法</span></span></span></span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">QQ邮箱登录时需要输入邮箱地址和</span><span style="color:#ff0000">QQ邮箱的授权码</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (26, 6, 1024, N'小米贷款到底多少个第三方平台放款的。', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">懂的人来，小米贷款到底多少个第三方平台放款的，反正借过小米贷款是新网银行合同是百分之百上征信的，这次借小米贷款是渤海信托合同的，这渤海信托上征信的吗？</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (28, 1, 1025, N'【小白终结帖】入门开发者必备学习资料大集合', N'<p>
    <span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);"><span style="font-size:18px">好吧，其实我只是想给大家分享一些安卓开发入门的书籍，开发版刚开版不久，而大多数的版友也多是对安卓开发比较陌生，因此版主特地收集了一些关于安卓的书籍，大家有空可以一起学习学习，不过虽然看书可以比较系统全面的了解安卓开发，但是经常上论坛和版友交流才可以更好的掌握喔~</span></span><br/><br/><span style="font-size:18px">======================</span><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);"><span style="font-size:18px">入门区</span></span><span style="font-size:18px">===========================</span><br/><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);"><span style="font-size:16px">Android 系统概述&nbsp;</span></span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (29, 2, 1026, N'开发人员必看：《小米应用开发者文档》', N'<p>
    <span style="font-size:32px"><span style="font-family:微软雅黑"><span style="color:#ff0000"><span style="word-wrap: break-word; font-weight: 700;">导读：</span></span></span></span>
</p>
<p>
    <span style="font-family:微软雅黑"><span style="font-size:18px"><br/>
    <p>
        <span style="word-wrap: break-word; font-weight: 700;">欢迎来到小米开发者文档目录导航，你可以在这里找到在小米手机上开发、分发应用的相关文档~</span>
    </p><br/>
    <p>
        <span style="word-wrap: break-word; font-weight: 700;"><span style="color:#000000">开发资料:</span></span>
    </p></span></span>
</p>
<p>
    <br/>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (31, 4, 1028, N'第三方应用开发者问题诊断说明', N'<p>
    <span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);"><span style="color:green">1、为什么在Manifest声明了android.permission.INTERNET还是无法访问网络？</span></span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">安全中心-网络助手里为用户提供了网络控制功能，如果把A应用的移动网络权限或者WIFI网络权限禁用了，那么在调用网络请求的时候会抛出异常：</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">java.net.ConnectException: socket failed: EACCES (Permission denied)</span><br/><br/><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);"><span style="color:green">2、为什么无法访问环回地址（127.0.0.1)?</span></span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">安全中心-网络助手里为用户提供了网络控制功能，如果把A应用的移动网络权限禁用，则该应用访问环回地址失败。</span><br/><br/><span style="color:green"><span style="word-wrap: break-word; font-weight: 700;">3、为什么我的应用在开启骚扰拦截之后收不到验证短信？</span></span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">骚扰拦截有智能引擎的判断，在开启智能拦截后我们会识别某些带有骚扰短信特征的短信。如果您认为您的短信被误判，可以联系我们。</span><br/><br/><span style="color:green"><span style="word-wrap: break-word; font-weight: 700;">4、为什么我的应用发起的回拨电话会被拦截？</span></span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">回拨电话有两种：一种是空号码，骚扰拦截有空号码拦截，在用户手动设置之后会拦截空号码。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">一种是正常号码，骚扰拦截有标记拦截的功能，在开启标记拦截且该号码被多次标记拉黑则会被拦截。</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (32, 5, 1029, N'小米6的MIUI9开发版怎么root？', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">手机版本如图所示，有些软件需要root，所以想试试，小米6的</span><span style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); cursor: pointer;">MIUI</span><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">9开发版怎么root？root后还保修吗？还有如果想关了root权限怎么办，求指教</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 2, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (33, 6, 1030, N'锁屏桌面那个快捷图标不起作用，为什么不取消了', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">锁屏桌面左下角那个快捷键为什么不起作用，每次系统更新也不取消了，一点作用都没有，在那里就是摆设</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">，如下图</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 2, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (35, 1, 1034, N'怎么进内测啊', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">我都申请了好多次了，不是说1200积分就能进吗？真是太失望了，只不过是体验一把最新的系统，至于这么难吗？</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/10.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (36, 8, 1035, N'系统更新失败', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">在刷最新的</span><span style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); cursor: pointer;">米柚</span><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">9开发版时停在.获取更新数据上了怎么办?请指教谢了!</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 4, N'pic_post/11.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (37, 9, 1036, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<table width="721">
    <tbody style="word-wrap: break-word;">
        <tr style="word-wrap: break-word;" class="firstRow">
            <td class="t_f" style="word-wrap: break-word;">
                <span style="word-wrap: break-word; font-weight: 700;"><span style="color:#FF0000"></span></span>小米mix2&nbsp;&nbsp;是不是因为超声波的关系所以完全没办法将防误触加进去？<br/>就因为一个屏幕牺牲了那么多功能<br/>红外线遥控也没有<br/>防误触也没有
            </td>
        </tr>
    </tbody>
</table>
<p>
    <br/>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 5, N'pic_post/12.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (38, 10, 1037, N'我得音量键怎么变成这样了', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">大家谁能懂得怎么返回去，我点击音量键老是出现一个蓝框，上面还有菜单2个字，是手机开机的时候好像设置一个什么我当时没注意随便点了下</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (39, 6, 1038, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">我是小米6刷的最新开发版可是语音助手还是小米语音助手，没有变成小爱同学怎么弄的？</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (40, 5, 1039, N'终于是等到了！！', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">等了好久好久，没等到，以为是后娘养的</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">前些天我申请了内测之后，不到3天就收到推送了！</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">好高兴啊&nbsp; &nbsp; 去升级了&nbsp; &nbsp;哈哈</span><br/><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">我是红米note4x磨砂黑高通版</span>
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (41, 3, 1040, N'我昨天晚上在线一小时了为什么没有更新还是3小时？', N'<p>
    我昨天一直看时间来的 &nbsp;明明够一个小时了 &nbsp;为什么没有加
</p>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 6, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (42, 4, 1041, N'[随便聊聊] MIUI9最新XP框架✦支持官方miui9✦亲测不卡米！不丢数据', N'<p><span style="word-wrap: break-word; font-weight: 700; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);"><span style="font-size:18px">&nbsp; &nbsp; &nbsp; 为了让更多人看到，</span></span>', CAST(N'2016-08-03 21:12:03.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (43, 3, 1042, N'【周一欢乐送#23】哪些智能产品改变了你的生活？赢好礼', N'<p> 周一欢乐送，每个周一见哦！&nbsp;', CAST(N'2015-08-24 00:00:00.000' AS DateTime), 1, 1, N'pic_post/13.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (44, 5, 1043, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>有没有跟我一样</p>', CAST(N'2014-11-24 19:38:00.000' AS DateTime), 1, 1, N'pic_post/14png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (48, 3, 1044, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>大家好，欢迎来到“今天来拍”，拍拍照，拿拿礼物，小科科又开始送礼物来了</p><p>今天来送10元米币卡，只要你是规定楼层数字的整数倍，只要你按照要求回复，</p><p>我们就送出米币卡，你们能抢多少楼，我们就敢送到多少楼，欢迎小伙伴们积极参加！！！</p><p>&nbsp;首先我们看看上期获奖米粉们的风采。。。大家多学学哦！</p><p><span style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;"></span></p><pre class="brush:html;toolbar:false"><br/></pre><p></p>', CAST(N'2017-08-27 19:38:00.000' AS DateTime), 1, 1, N'pic_post/15.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (49, 8, 1045, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>听说关了会省电真假的？</p><pre class="brush:html;toolbar:false"><br/></pre>', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (50, 6, 1046, N'深夜卧谈会97：校园和社会最大的区别', N'<p>谈起校园，就不得不谈起青春。关于青春、校园的影视作品很多，比如《致青春》、《睡在我上铺的兄弟》、《左耳》、《同桌的你》、《谁的青春不迷茫》……关于青春的记忆是最美好的。</p><p>我们一般都会</p><pre class="brush:html;toolbar:false"><br/></pre>', CAST(N'2014-11-24 19:38:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (51, 8, 1047, N'等你来辩：“旗舰机”“全面屏”商标应该被注册吗？', N'<p>更多精彩问答，戳我»最近，360旗下的子公司奇酷互联网络科技有限公司已经抢先申请注册“旗舰机”的商标，</p><p>并且类别覆盖的十分广泛，包括智能手机，移动电话，手机壳，手机套，手机屏幕专用保护膜等等……虽然，</p><p>360申请的“旗舰机”商标是在等待审核的状态，但是只要一通过！就意味着其他手机厂商都不能随便叫“旗舰机”！</p><p><span style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;"></span>这一行为掀起了业内网友的大讨论！部分网友认为：这显然是对现有用户认知的一种冲击，多少有点不正当竞争的味道。也有部分网友认为：属于一种商业策略而已。<br/></p>', CAST(N'2017-10-17 18:48:00.000' AS DateTime), 1, 1, N'pic_post/16.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (52, 9, 1048, N'[糗事笑话] 大家打王者的有没有遇到这种尴尬的事情？', N'<p>全场仅仅只剩我一个，然而敌不过对面一小兵😳😳😳</p><pre class="brush:html;toolbar:false"><br/></pre><p><br/>', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 2, 1, N'pic_post/17.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (53, 4, 1049, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>可以留下QQ微信互撩一波</p><pre class="brush:html;toolbar:false"><br/></pre>', CAST(N'2017-10-17 18:48:00.000' AS DateTime), 1, 2, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (54, 3, 1050, N'[随便聊聊] 深夜卧谈会98：你讨厌或不欣赏异性的哪些行为？', N'<strong><font color="Red">活动规则：</font></strong>临近年底，跟帖说说这一年中，你最想感谢的那个人是谁，你们之间发生了什么样的故事。（抄袭则取消中奖机会）<br><br>', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 3, 1, N'pic_post/19.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (55, 5, 1051, N'[玩机故事] 你们用的手机都摔过吗？L', N'<strong><font color="Red">活动规则：</font></strong>临近年底，跟帖说说这一年中，你最想感谢的那个人是谁，你们之间发生了什么样的故事。（抄袭则取消中奖机会）<br><br>', CAST(N'2017-10-17 18:48:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (56, 4, 1052, N'[随便聊聊] 什么才是你的梦幻手柄，一起来聊聊。游戏手柄进化史，...', N'<strong><font color="Red">活动规则：</font></strong>临近年底，跟帖说说这一年中，你最想感谢的那个人是谁，你们之间发生了什么样的故事。（抄袭则取消中奖机会）<br><br>', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 1, 1, N'pic_post/18.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (57, 6, 1053, N' 捷报：印度市场，小米成为了排名第一的智能手机品牌', N'<p>谈起校园，就不得不谈起青春。关于青春、校园的影视作品很多，比如《致青春》、《睡在我上铺的兄弟》、《左耳》、《同桌的你》、《谁的青春不迷茫》……关于青春的记忆是最美好的。</p><p>我们一般都会</p><pre class="brush:html;toolbar:false"><br/></pre>', CAST(N'2017-11-24 00:00:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (58, 6, 1054, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<strong><font color="Red">活动规则：</font></strong>临近年底，跟帖说说这一年中，你最想感谢的那个人是谁，你们之间发生了什么样的故事。（抄袭则取消中奖机会）<br><br>', CAST(N'2017-11-01 18:48:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (59, 3, 1055, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<strong><font color="Red">活动规则：</font></strong>临近年底，跟帖说说这一年中，你最想感谢的那个人是谁，你们之间发生了什么样的故事。（抄袭则取消中奖机会）<br><br>', CAST(N'2017-09-21 18:48:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (60, 8, 1056, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>谈起校园，就不得不谈起青春。关于青春、校园的影视作品很多，比如《致青春》、《睡在我上铺的兄弟》、《左耳》、《同桌的你》、《谁的青春不迷茫》……关于青春的记忆是最美好的。</p><p>我们一般都会</p><pre class="brush:html;toolbar:false"><br/></pre>', CAST(N'2017-11-21 18:48:00.000' AS DateTime), 1, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (61, 5, 1057, N'[其它] 很快，Andriod 手机也能和蓝牙耳机快速配对了', N'<p>更多精彩问答，戳我»最近，360旗下的子公司奇酷互联网络科技有限公司已经抢先申请注册“旗舰机”的商标，</p><p>并且类别覆盖的十分广泛，包括智能手机，移动电话，手机壳，手机套，手机屏幕专用保护膜等等……虽然，</p><p>360申请的“旗舰机”商标是在等待审核的状态，但是只要一通过！就意味着其他手机厂商都不能随便叫“旗舰机”！</p><p><span style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;"></span>这一行为掀起了业内网友的大讨论！部分网友认为：这显然是对现有用户认知的一种冲击，多少有点不正当竞争的味道。也有部分网友认为：属于一种商业策略而已。<br/></p>', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 3, 1, N'pic_post/default.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (62, 9, 1058, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>谈起校园，就不得不谈起青春。关于青春、校园的影视作品很多，比如《致青春》、《睡在我上铺的兄弟》、《左耳》、《同桌的你》、《谁的青春不迷茫》……关于青春的记忆是最美好的。</p><p>我们一般都会</p><pre class="brush:html;toolbar:false"><br/></pre>', CAST(N'2017-12-21 18:48:00.000' AS DateTime), 1, 1, N'pic_post/8.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (63, 10, 1059, N'[求助问答] 如果因为溜车导致的后车追尾，算谁的责任呢？', N'<p>更多精彩问答，戳我»最近，360旗下的子公司奇酷互联网络科技有限公司已经抢先申请注册“旗舰机”的商标，</p><p>并且类别覆盖的十分广泛，包括智能手机，移动电话，手机壳，手机套，手机屏幕专用保护膜等等……虽然，</p><p>360申请的“旗舰机”商标是在等待审核的状态，但是只要一通过！就意味着其他手机厂商都不能随便叫“旗舰机”！</p><p><span style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;"></span>这一行为掀起了业内网友的大讨论！部分网友认为：这显然是对现有用户认知的一种冲击，多少有点不正当竞争的味道。也有部分网友认为：属于一种商业策略而已。<br/></p>', CAST(N'2016-12-19 00:00:00.000' AS DateTime), 1, 1, N'pic_post/7.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (64, 10, 1060, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>谈起校园，就不得不谈起青春。关于青春、校园的影视作品很多，比如《致青春》、《睡在我上铺的兄弟》、《左耳》、《同桌的你》、《谁的青春不迷茫》……关于青春的记忆是最美好的。</p><p>我们一般都会</p><pre class="brush:html;toolbar:false"><br/></pre>', CAST(N'2017-09-11 18:48:00.000' AS DateTime), 1, 1, N'pic_post/6.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (65, 2, 1061, N'[女生] 贴图自拍无敌可爱的我', N'<p>更多精彩问答，戳我»最近，360旗下的子公司奇酷互联网络科技有限公司已经抢先申请注册“旗舰机”的商标，</p><p>并且类别覆盖的十分广泛，包括智能手机，移动电话，手机壳，手机套，手机屏幕专用保护膜等等……虽然，</p><p>360申请的“旗舰机”商标是在等待审核的状态，但是只要一通过！就意味着其他手机厂商都不能随便叫“旗舰机”！</p><p><span style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;"></span>这一行为掀起了业内网友的大讨论！部分网友认为：这显然是对现有用户认知的一种冲击，多少有点不正当竞争的味道。也有部分网友认为：属于一种商业策略而已。<br/></p>', CAST(N'2016-06-19 00:00:00.000' AS DateTime), 1, 1, N'pic_post/5.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (66, 10, 1057, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>asdfasdf<img src="http://img.baidu.com/hi/jx2/j_0068.gif"/><img src="http://img.baidu.com/hi/jx2/j_0079.gif"/>333333333333333<img src="http://img.baidu.com/hi/jx2/j_0078.gif"/></p>', CAST(N'2017-11-20 18:05:56.000' AS DateTime), 6, 1, N'pic_post/4.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (67, 9, 1057, N'周三福利君Vol.22：感恩节福利，见者有份！', N'<p>GBGdsgdsfg<img src="http://img.baidu.com/hi/jx2/j_0078.gif"/></p>', CAST(N'2017-11-20 18:10:53.000' AS DateTime), 1, 1, N'pic_post/3.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (68, 9, 1057, N'啊时光如梭', N'<p>sdfgsdfg<img src="http://img.baidu.com/hi/jx2/j_0078.gif"/></p>', CAST(N'2017-11-20 18:12:37.000' AS DateTime), 3, 1, N'pic_post/2.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (76, 2, 1057, N'小米IOT开发者大会28日召开，或宣布开放战略', N'<p style="color: rgb(0, 0, 0); white-space: normal;"><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px;">小米旗下智能家居品牌mijia米家官方微博发布消息，将于11月28日在京召开首届小米IoT开发者大会，并且海报中小米公司创始人雷军也表示“每天有超过8万个新增设备接入小米IOT平台，我们欢迎更多合作伙伴加入这个全球最大智能硬件IOT平台”。</span><br/><br/></p><div style="white-space: normal; text-align: center; word-wrap: break-word; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px;"><img id="aimg_15200585" src="https://attach.bbs.miui.com/forum/201711/22/172857tngjj9c1jab5z22g.jpg.thumb.jpg" width="690" height="1227" style="word-wrap: break-word; cursor: pointer;"/></div><p style="color: rgb(0, 0, 0); white-space: normal;"><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px;">根据之前小米公布的数据，截止到2017年上半年，小米IOT平台已经拥有超过6000万个在网智能硬件设备，同时在线设备超过600万，成为全球最大的商用物联网硬件平台。纵览小米官网，已经有超过100款智能硬件产品在售，小米手环、小米空气净化器、小米净水器、米家扫地机器人、9号平衡车、米家电饭煲、米家台灯等智能硬件产品销量巨大，基本上做到了生活中处处可见小米设备。</span><br/><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px;">和前几年不同，今年小米智能家庭App——米家App上非小米品牌、非小米生态链公司出品的第三方智能硬件产品越来越多，甚至小米自建了除了小米网之外的第二个电商平台——有品。在通过小米生态链战略站上了全球最大的商用物联网硬件平台后，获得阶段性胜利的小米想必也将把心态放的更开放。试想一下，家中其他品牌的产品大到空调、洗衣机、电冰箱，小到扫地机、净水器、电动牙刷、台灯、摄像头如果都能够加入到小米IoT平台，并且共享其他现有智能硬件的数据实现自动控制，真正能够实现所有家居的智能化。所以小米IoT的开放应该是本次小米开发者大会的一个重要议题,具体如何开放，就有待大会上见分晓了。</span></p><div><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px;"><br/></span></div><p><br/></p>', CAST(N'2017-11-22 22:28:58.000' AS DateTime), 40, 1, N'pic_post/iot.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (79, 2, 1072, N'最生活浴巾评测汇总', N'<p style="text-align: center;"><img src="http://static.geek.miui.com/uploadfile/2017/0120/20170120095652135.jpg" width="625" style="background-repeat: no-repeat; color: rgb(0, 0, 0); font-family: &quot;microsoft yahei&quot;; font-size: medium; white-space: normal;"/><span style="color: rgb(0, 0, 0); font-family: &quot;microsoft yahei&quot;; font-size: medium; white-space: normal;"></span></p><div class="article_content" style="background-repeat: no-repeat; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; line-height: 22px; font-family: &quot;microsoft yahei&quot;; white-space: normal;"><p style="background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(0, 0, 0); text-align: center;"><span style="background-repeat: no-repeat; font-family: 黑体;"><span style="background-repeat: no-repeat;">洗澡的时候，你总是要把我带到浴室。<br/>我问你为什么，我怎么会是那种偷看女孩洗澡的“人”<br/>你回答说我可以陪你聊天。<br/>可是洗澡的时候你却从不搭理我，<br/>那……那我只能直勾勾地看你洗澡啦！<br/>……<br/>洗完澡后你嗖的一下钻进我怀里，<br/>好吧……<br/>拥抱洗澡后的你，给你最温暖的拥抱，<br/>也许就是我存在的意义，<br/>我已经心满意足♪~♫~♩~♬~~”<br/>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; ——《一条“最生活”浴巾的独白》</span></span></p><p class="ts" style="background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(0, 0, 0);"><br/><span style="background-repeat: no-repeat;"><span style="background-repeat: no-repeat; font-family: 微软雅黑;">最懂你生活的浴巾——最生活浴巾评测汇总：<br/><br/><span style="background-repeat: no-repeat; font-size: 10.5pt;">● jess415</span><br/><br/><a href="http://undefined" id="thread_subject" style="background-repeat: no-repeat;"><span style="background-repeat: no-repeat; color: rgb(75, 0, 130);"><strong style="background-repeat: no-repeat;">【极客试用】品质生活从一条好的浴巾开始</strong></span></a></span></span></p><p class="ts" style="background-repeat: no-repeat; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(0, 0, 0);"><br/><div style="text-align: center;"><img alt="\" src="http://static.geek.miui.com/uploadfile/2017/0120/20170120090501323.jpg" style="font-size: 10.5pt; font-family: 微软雅黑; background-repeat: no-repeat; width: 600px; height: 400px;"/></div><span style="background-repeat: no-repeat;"><span style="background-repeat: no-repeat; font-family: 微软雅黑;"><span style="background-repeat: no-repeat; font-size: 10.5pt;"><br/>生活的品质从一条浴巾开始，一条好的浴巾让生活舒适。每天都要洗澡是为了干净，使用一条干净无菌的浴巾，让洗澡变成更美好吧。</span><br/><br/><span style="background-repeat: no-repeat;"><span style="background-repeat: no-repeat;background-repeat: no-repeat; font-size: 10.5pt;">●&nbsp;</span></span>Su蘇小寧<br/><br/><a href="http://undefined" id="thread_subject" style="background-repeat: no-repeat;"><span style="background-repeat: no-repeat; color: rgb(75, 0, 130);"><strong style="background-repeat: no-repeat;">【极客试用】最生活——浴巾让生活更美好</strong></span><br/><br/><div style="text-align: center;"><a href="http://undefined" id="thread_subject" style="background-color: rgb(255, 255, 255); background-repeat: no-repeat;"><img alt="\" src="http://static.geek.miui.com/uploadfile/2017/0120/20170120090812809.jpg" style="background-repeat: no-repeat; width: 650px; height: 488px;"/></a></div></a><br/>最生活浴巾采用的长绒棉，精选自阿瓦提。高品质棉纱几乎全部使用长绒棉为原料，而稀缺的长绒棉仅占世界棉花产量不到1%。阿瓦提，是全球长绒棉唯一年日照超过3000小时的产地，我们3次历经12000公里，委托种植3000亩棉田，确保最生活的每一条浴巾都能使用更好的阿瓦提长绒棉。<br/><br/>&nbsp;<span style="background-repeat: no-repeat;"><span style="background-repeat: no-repeat;background-repeat: no-repeat; font-size: 10.5pt;">●&nbsp;</span></span>憇菿蕜傷</span></span></p></div><p><br/></p>', CAST(N'2017-11-23 22:17:33.000' AS DateTime), 12, 0, N'pic_post/shyj.jpg')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (81, 2, 1072, N'感恩节特惠篇：买就一个字，我只说一次！', N'<p><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal;">感恩节特惠，款款有礼→</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal;">①#小米5X# 立减100元，还赠WIFI放大器、米粉卡；</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal;">②小米MIX 2 6+64GB版、小米Note 3 6+128GB版，下单加99元送小米AI音箱，还享花呗12期分期免息；</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal;">③小米Max 2 赠体重秤和米粉卡，还享小米12期分期免息！</span><br/><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal;">除了手机，还有这些特惠，拿好了——</span><br/><br/></p><div style="text-align: center; word-wrap: break-word; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal;"><img id="aimg_15200974" src="https://attach.bbs.miui.com/forum/201711/22/174718fwnoxvicwv5mzmft.png.thumb.jpg" width="485" height="821" style="word-wrap: break-word; cursor: pointer;"/></div><p><br/></p>', CAST(N'2017-11-23 22:24:06.000' AS DateTime), 23, 0, N'pic_post/2.png')
INSERT [dbo].[Tbl_Post] ([postId], [forumId], [UID], [postTitle], [postContent], [postTime], [pageViews], [regen], [pic]) VALUES (84, 2, 1057, N'【评论领福利】感谢命运让我们相遇', N'<table style="word-wrap: break-word; empty-cells: show; table-layout: fixed; width: 721px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><tbody style="word-wrap: break-word;"><tr style="word-wrap: break-word;"><td class="t_f" id="postmessage_195750804" style="word-wrap: break-word; font-size: 14px;"><span style="word-wrap: break-word; font-weight: 700;color:#FF0000;word-wrap: break-word;"></span><div style="word-wrap: break-word;"><img id="aimg_15191294" src="https://attach.bbs.miui.com/forum/201711/22/093423ra83fxdaakdae8xa.jpg.thumb.jpg" width="719" height="283" style="word-wrap: break-word; cursor: pointer; width: 551px; height: 195px;"/></div><br/><br/><br/><div style="word-wrap: break-word;"><span style="font-family:微软雅黑;word-wrap: break-word;">感恩节来啦</span>~又到了吃鸡的季节。</div><br/><div style="word-wrap: break-word;"><span style="font-family:微软雅黑;word-wrap: break-word;">虽然每年的</span>11月第4个星期四都是名义上的感恩节，但感恩却不是狂风暴雨，不是鸡汤的集体泛滥，不是高档礼物的狂轰滥炸。</div><br/><div style="word-wrap: break-word;">感恩应当是细水长流，是每天一句的我爱你，是无数日夜的搀扶前行。</div><br/><div style="word-wrap: break-word;"><span style="font-family:微软雅黑;word-wrap: break-word;">在这个特殊的日子里，绿米联创感恩所有的米粉陪伴绿米走到了</span>2017的尾巴，这一年感恩你们默默地支持和陪伴，让我们以及米家所有的产品在11月爆发了前所未有的成绩。</div><br/><div style="word-wrap: break-word;"><span style="font-family:微软雅黑;word-wrap: break-word;">这个</span>11月，我们也准备了一些小礼物送给大家。</div><br/><br/><div style="word-wrap: break-word;"><span style="word-wrap: break-word; font-weight: 700;">活动规则：</span></div><div style="word-wrap: break-word;">在本帖下留言回复感恩节你最想感恩的人，如果可以送一件绿米联创的产品给他，你希望是什么？</div><br/><br/><div style="word-wrap: break-word;"><span style="word-wrap: break-word; font-weight: 700;">活动时间：</span>2017.11.22-2017.11.26</div><br/><br/><div style="word-wrap: break-word;"><span style="word-wrap: break-word; font-weight: 700;">评选时间：</span>2017.11.27-2017.11.30</div><br/><br/><div style="word-wrap: break-word;"><span style="word-wrap: break-word; font-weight: 700;">活动奖品：</span>Aqara无线开关（贴墙单键版）*10</div><br/><div style="word-wrap: break-word;"><img id="aimg_15191441" src="https://attach.bbs.miui.com/forum/201711/22/094302dyyxz463zzw30b1t.jpg.thumb.jpg" width="720" height="720" style="word-wrap: break-word; cursor: pointer; width: 648px; height: 694px;"/></div></td></tr></tbody></table><p><br/></p>', CAST(N'2017-11-23 22:35:19.000' AS DateTime), 26, 0, N'pic_post/gn.jpg')
SET IDENTITY_INSERT [dbo].[Tbl_Post] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Reply] ON 

INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (1, 10, 1, 1003, N'1007', N'<p>
    1.开发版手机开启root权限
安全中心-授权管理-ROOT权限管理（如果失败，请检查手机已登陆小米帐号/手机解锁）
</p>
', CAST(N'2017-09-03 12:12:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (2, 10, 2, 1003, N'1007', N'<p>
    游戏打的最好的是小米网（2016冠军）
</p>
<p>
    和小米互娱（2017冠军）（小米超神）
</p>', CAST(N'2017-10-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (3, 10, 3, 1003, N'1007', N'<p>
    小米CEO雷军大二就修完四年学分了
</p>', CAST(N'2017-04-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (4, 11, 1, 1007, N'1003', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">小米是2011年的4月6号成立的，成立的地点在北四环保福寺银谷大厦的一个很小的房间里头，最早创立的团队14个人，大家一大早起来围在一起喝了一碗小米粥，这个公司就成立了，这碗小米粥是黎万强的父亲早上5点钟起来熬好了粥送到公司。</span>
</p>', CAST(N'2017-11-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (5, 11, 2, 1007, N'1003', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">雷总其实是一个被手机科技耽误的歌手。《are you ok？》是他的成名曲。。😂😂😂</span>
</p>', CAST(N'2017-06-12 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (6, 11, 3, 1007, N'1003', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">MIX系列由来：小米MIX 是小米探索黑科技的代表作，取名字的时候打算叫 MI X，X代表未知和探索，后来觉得还是连在一起更方便读，就改成了 MIX。</span>
</p>', CAST(N'2017-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (7, 21, 4, 1011, N'1015', N'<p>
    我现在是MIUI9 10.26开发版，刷成稳定版能直接刷？
</p', CAST(N'2017-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (8, 21, 5, 1011, N'1015', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">1，首先是小米公司的命名:大家一起围在一块喝小米粥，于是这个公司就成立了</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">2，小米视频app是小米电视团队负责运营的。3，米家摄像头是紫米(小米移动电源)做的；米家小白和米家云台版是创米(小米收音机/万能遥控器)做的；</span>
</p>', CAST(N'2017-10-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (9, 21, 6, 1011, N'1015', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">米家智能插线板是紫米做的；非智能的插线板是青米做的；而智能插座Zigbee版则是绿米(多功能网关)；智能插座基础版是创米。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">4，小方智能摄像机和ihealth血压计师出同门。</span>
</p>', CAST(N'2017-04-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (10, 21, 7, 1015, N'1015', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">5，小米主题微博曾经留言给Flyme主题说多喝热水。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">6，五彩城公区可以从B1直接去五彩城购物中心。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">7，小米很多产品照片的模特都不是外请的，大多数都是自家员工。</span>
</p>', CAST(N'2017-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (11, 17, 2, 1015, N'1011', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">8，小米的logo是一个“MI”，是Mobile Internet的缩写，代表小米是一家移动互联网公司。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">9，小米公司养过一只狗，叫旺财。</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">10，雷军是一个被手机公司耽误的灵魂段子歌手《Are you ok?》网红歌，成名曲。哈哈😄</span>
</p>', CAST(N'2017-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (12, 17, 3, 1015, N'1018', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">泛黄的物理书上说 声音的传播速度是340m/s 那简单的一句l am waiting for you 要被时光隐藏多久你才能听闻得到 三秒 三年 或十年 你未曾给我一颗安定的心 我又怎敢独自旅行 ..</span>
</p>', CAST(N'2017-06-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (13, 18, 1, 1017, N'1018', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">纳尼。蘑菇稿子还没写好</span>
</p>', CAST(N'2017-09-03 12:12:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (14, 18, 2, 1017, N'1018', N'<p>
    哈哈哈一楼抢到了继续抢二楼
</p>', CAST(N'2017-06-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (15, 18, 3, 1017, N'1018', N'<p>
    三楼我也要了，可以开心一整天了
</p>', CAST(N'2017-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (16, 19, 1, 1018, N'1020', N'<p>
    我现在是MIUI9 10.26开发版，刷成稳定版能直接刷？
</p>', CAST(N'2017-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (17, 19, 2, 1018, N'1020', N'<p>
    MIX2又冒烟儿喽，等吧！
</p>', CAST(N'2017-02-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (18, 19, 3, 1018, N'1020', N'<p>
    MIUI9稳定版线刷包在哪儿下载呀
</p>', CAST(N'2017-03-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (19, 20, 1, 1019, N'1003', N'<p>
    我爆料，兔子是某个你们熟悉的管理员。
</p>', CAST(N'2017-04-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (20, 20, 2, 1019, N'1003', N'<p>
    极客改造家，改造我心中炫酷的那辆新雷诺卡缤
</p>', CAST(N'2017-05-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (21, 20, 3, 1019, N'1003', N'<p>
    期待后续活动～
</p>', CAST(N'2017-06-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (22, 21, 1, 1020, N'1007', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">果断支持了，感谢大家那几天的辛苦付出，亲历拍摄过程，确实很不容易！话说帖子里的那两只兔子怎么样，可不可爱？！</span>
</p>', CAST(N'2017-07-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (23, 21, 2, 1020, N'1007', N'<p>
    感觉他们用的都是单反
</p>', CAST(N'2017-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (24, 21, 3, 1020, N'1007', N'<p>
    不错，拍的很好，看
</p>', CAST(N'2017-09-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (25, 22, 1, 1021, N'1020', N'<p>
    诶呦，我看到了我的照片哦(´-ω-`)
</p>', CAST(N'2017-10-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (26, 22, 2, 1021, N'1020', N'<p>
    红米note4x初音没有推送
</p>', CAST(N'2017-11-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (27, 22, 3, 1021, N'1020', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">还在等待………………</span>
</p>', CAST(N'2017-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (28, 23, 1, 1022, N'1017', N'<p>
    来自mtk的怨念(≖_≖ )。。。。。
</p>', CAST(N'2017-06-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (30, 23, 3, 1022, N'1017', N'<p>
    明年年底估计能更新吧。。
</p>', CAST(N'2017-06-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (31, 24, 1, 1023, N'1015', N'<p>
    别人的可以不
</p>', CAST(N'2017-07-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (32, 24, 2, 1023, N'1015', N'<p>
    啥破红米到现在不能升级
</p>', CAST(N'2017-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (33, 24, 3, 1023, N'1015', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">不止我一个傻，百分之八十的人都傻，百分之八十的都是联发科，只有高通版本全部推送完毕</span>
</p>', CAST(N'2017-08-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (34, 25, 1, 1024, N'1018', N'<p>
    我是开发版
</p>', CAST(N'2017-03-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (35, 25, 2, 1024, N'1018', N'<p>
    我浅蓝色内测组表示并没有收到稳定版的推送
</p>', CAST(N'2017-03-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (36, 25, 3, 1024, N'1018', N'<p>
    还木有，一直是内测版
</p>', CAST(N'2017-04-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (37, 26, 1, 1025, N'1019', N'<p>
    我能从开发版直接卡刷吗？
</p>', CAST(N'2017-04-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (38, 26, 2, 1025, N'1019', N'<p>
    不能吧，我是稳定版升的
</p>', CAST(N'2017-04-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (39, 26, 3, 1025, N'1019', N'<p>
    一不小心就15个字了，好烦的说啊，哈哈
</p>', CAST(N'2017-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (40, 28, 1, 1026, N'1023', N'<p>
    不能再刷回稳定版
</p>', CAST(N'2017-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (41, 28, 2, 1026, N'1023', N'<p>
    我的已经更新了，哈哈，真的速度好快啊
</p>', CAST(N'2017-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (42, 28, 3, 1026, N'1023', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">谁告诉你的，高通版表示还未收到推送</span>
</p>', CAST(N'2017-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (43, 29, 1, 1027, N'1024', N'<p>
    还是MIUI8好用
</p>', CAST(N'2017-02-10 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (45, 29, 3, 1027, N'1024', N'<p>
    关闭验证了😒
</p>', CAST(N'2017-03-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (46, 31, 6, 1028, N'1022', N'<p>
    还是用正式版8吧，9推送应该快了，现在确实耗电比8快。
</p>', CAST(N'2017-03-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (47, 31, 5, 1028, N'1022', N'<p>
    不刷内测了，坐等正式版，用过9.0.0.1耗电比开发版还厉害
</p>', CAST(N'2017-03-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (48, 31, 4, 1028, N'1022', N'<p>
    等不了推送了，自己卡刷了
</p>', CAST(N'2017-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (49, 31, 1, 1029, N'1027', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">至今还没进内测组，点个赞,</span><br/><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">吧</span>
</p>', CAST(N'2017-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (50, 31, 2, 1029, N'1027', N'<p>
    是稳定版推送的么
</p>', CAST(N'2017-11-23 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (51, 31, 3, 1029, N'1027', N'<p>
    我没有收到，高通开发版
</p>', CAST(N'2017-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (52, 32, 1, 1030, N'1025', N'<p>
    还在，继续，等待中~~
</p>', CAST(N'2017-10-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (53, 32, 2, 1030, N'1025', N'<p>
    尼玛的等的花儿都谢了
</p>', CAST(N'2017-07-08 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (54, 32, 3, 1030, N'1025', N'<p>
    我的高通低配版稳定版反正没收到
</p>', CAST(N'2017-07-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (55, 33, 1, 1034, N'1028', N'<p>
    等到花都枯死了......
</p>', CAST(N'2017-08-08 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (56, 33, 2, 1034, N'1028', N'<p>
    一直是内测版好气呀，没有魔法消除
</p>', CAST(N'2017-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (57, 33, 3, 1034, N'1028', N'<p>
    又可以了？🤔
</p>', CAST(N'2017-08-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (58, 35, 1, 1035, N'1030', N'<p>
    就是想用分屏，不说了，准备刷了
</p>', CAST(N'2017-09-14 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (59, 35, 2, 1035, N'1030', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">在下面贴子里找，刚刚还看到。</span>
</p>', CAST(N'2017-09-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (60, 35, 3, 1035, N'1030', N'<p>
    我的是红米note4 x浅蓝色的反正没有稳定版
</p>', CAST(N'2017-09-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (61, 36, 1, 1036, N'1034', N'<p>
    能发个MIUI9链接给我吗？
</p>', CAST(N'2017-10-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (62, 36, 2, 1036, N'1034', N'<p>
    联发科处理器有升到m9？
</p>', CAST(N'2017-10-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (63, 36, 3, 1036, N'1034', N'<p>
    真是无聊，这值得投票吗
</p>', CAST(N'2017-10-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (64, 37, 1, 1037, N'1036', N'<p>
    这个会清除数据吗？<img src="http://img.baidu.com/hi/jx2/j_0019.gif"/>
</p>', CAST(N'2017-11-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (65, 37, 2, 1037, N'1036', N'<p>
    我**红米note4X已经更新完了<img src="http://img.baidu.com/hi/jx2/j_0057.gif"/>
</p>', CAST(N'2017-11-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (66, 37, 3, 1037, N'1036', N'<p>
    不用内测组也可以
</p>', CAST(N'2017-11-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (67, 38, 1, 1038, N'1030', N'<p>
    啦啦啦，我是小内测。早就升级miui9
</p>', CAST(N'2017-12-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (68, 38, 2, 1038, N'1030', N'<p>
    手动卡刷，使用论坛里的链接
</p>', CAST(N'2017-12-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (69, 38, 3, 1038, N'1030', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">一切都好，感觉不出来miui9跟8有什么区别，除了原机浏览器广告多了其他真的没感觉有区别</span>
</p>', CAST(N'2017-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (70, 39, 1, 1039, N'1027', N'<p>
    论坛链接卡刷成功
</p>', CAST(N'2017-09-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (71, 39, 2, 1039, N'1027', N'<p>
    我的4x也没收到，唉，老雷可能已经忘了手机用户最多的红米note4x了
</p>', CAST(N'2017-09-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (72, 39, 3, 1039, N'1027', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">没有升级的要考虑清楚，特费电，我的是推送的。</span>
</p>', CAST(N'2017-09-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (73, 40, 1, 1040, N'1023', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">申请了内测 还没通过 但是收到了MIUI9内测版 刷后变稳定版了 耗电跟MIUI8一样 快如闪电 赞一个</span>
</p>', CAST(N'2017-08-08 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (74, 40, 2, 1040, N'1023', N'<p>
    <span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">我的是开发版的miui9更费电，想刷稳定版的</span>
</p>', CAST(N'2017-08-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (75, 40, 3, 1040, N'1023', N'<p>
    论坛的链接卡刷上车成功！
</p>', CAST(N'2017-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (76, 41, 1, 1038, N'1035', N'<p>
    第一批刚推送，不知道闹特四岔排第几批
</p>', CAST(N'2017-07-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (77, 41, 2, 1039, N'1035', N'<p>
    。。想进内测组至今还未通过，你给我点赞加点积分吧，反正你也不损失,谢谢！！
</p>', CAST(N'2017-07-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (78, 41, 3, 1040, N'1035', N'<p>
    自己不会刷吗？去小米维修店直接刷了，我刚买来就刷9了，都用好久了
</p>', CAST(N'2017-07-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (79, 20, 3, 1018, N'1057', N'<p><img src="http://img.baidu.com/hi/jx2/j_0013.gif"/><img src="http://img.baidu.com/hi/jx2/j_0040.gif"/><img src="http://img.baidu.com/hi/jx2/j_0046.gif"/>fry45y4fdshsdfhrsd</p>', CAST(N'2017-11-20 17:50:34.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (81, 18, 3, 1015, N'1057', N'<p>asdfas<img src="http://img.baidu.com/hi/jx2/j_0001.gif"/><img src="http://img.baidu.com/hi/jx2/j_0070.gif"/><img src="http://img.baidu.com/hi/jx2/j_0079.gif"/><img src="http://img.baidu.com/hi/jx2/j_0084.gif"/><img src="http://img.baidu.com/hi/face/i_f29.gif"/></p>', CAST(N'2017-11-20 17:52:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (83, 37, 3, 1036, N'1057', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0002.gif"/></p>', CAST(N'2017-11-20 17:54:54.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (84, 40, 4, 1039, N'1057', N'<p>111<img src="http://img.baidu.com/hi/jx2/j_0013.gif"/><span style="text-decoration:underline;">rwerwerwreqwe</span><span style="text-decoration:underline;font-style: italic;">rwerwqeerwetwetewt</span><em>ertert</em><strong><em>erwterwtrewyterwt</em>rewt</strong>wertewrt<img src="http://img.baidu.com/hi/jx2/j_0024.gif"/></p>', CAST(N'2017-11-20 18:03:00.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (147, 66, 1, 1057, N'1057', N'<p>2143<img src="http://img.baidu.com/hi/jx2/j_0003.gif"/></p>', CAST(N'2017-11-20 18:10:36.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (148, 68, 1, 1057, N'1057', N'<p>1234<img src="http://img.baidu.com/hi/jx2/j_0002.gif"/></p>', CAST(N'2017-11-20 18:13:45.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (149, 67, 1, 1057, N'1057', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0002.gif"/></p>', CAST(N'2017-11-20 18:14:38.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (150, 66, 2, 1057, N'1072', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0024.gif"/></p>', CAST(N'2017-11-20 19:34:25.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (163, 17, 4, 1011, N'1072', N'<p><img src="http://img.baidu.com/hi/jx2/j_0065.gif"/><img src="http://img.baidu.com/hi/jx2/j_0015.gif"/><img src="http://img.baidu.com/hi/jx2/j_0002.gif"/><img src="http://img.baidu.com/hi/jx2/j_0005.gif"/><img src="http://img.baidu.com/hi/jx2/j_0004.gif"/><img src="http://img.baidu.com/hi/jx2/j_0002.gif"/><img src="http://img.baidu.com/hi/jx2/j_0001.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (164, 17, 5, 1011, N'1057', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0002.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (165, 17, 6, 1011, N'1030', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0024.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (166, 17, 7, 1011, N'1023', N'<p>
    我现在是MIUI9 10.26开发版，刷成稳定版能直接刷？
</p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (167, 17, 8, 1011, N'1027', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0024.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (168, 17, 9, 1011, N'1017', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0002.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (169, 17, 10, 1011, N'1023', N'<p>
    我现在是MIUI9 10.26开发版，刷成稳定版能直接刷？
</p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (170, 17, 11, 1011, N'1027', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0024.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (171, 17, 2, 1011, N'1072', N'<p>2143<img src="http://img.baidu.com/hi/jx2/j_0003.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (172, 17, 13, 1011, N'1017', N'<p><img src="http://img.baidu.com/hi/jx2/j_0065.gif"/><img src="http://img.baidu.com/hi/jx2/j_0015.gif"/><img src="http://img.baidu.com/hi/jx2/j_0002.gif"/><img src="http://img.baidu.com/hi/jx2/j_0005.gif"/><img src="http://img.baidu.com/hi/jx2/j_0004.gif"/><img src="http://img.baidu.com/hi/jx2/j_0002.gif"/><img src="http://img.baidu.com/hi/jx2/j_0001.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (173, 17, 2, 1011, N'1034', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0024.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (174, 17, 2, 1011, N'1057', N'<p>2143<img src="http://img.baidu.com/hi/jx2/j_0003.gif"/></p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (175, 17, 1, 1011, N'1023', N'<p>
    我现在是MIUI9 10.26开发版，刷成稳定版能直接刷？
</p>', CAST(N'2017-11-22 20:00:29.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (176, 22, 4, 1020, N'1072', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0001.gif"/></p>', CAST(N'2017-11-22 20:29:15.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (177, 51, 1, 1047, N'1057', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0026.gif"/></p>', CAST(N'2017-11-22 21:47:34.000' AS DateTime))
GO
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (178, 58, 1, 1054, N'1057', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0016.gif"/></p>', CAST(N'2017-11-22 21:48:39.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (179, 43, 1, 1042, N'1057', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0013.gif"/></p>', CAST(N'2017-11-22 21:48:52.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (180, 49, 1, 1045, N'1057', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0084.gif"/></p>', CAST(N'2017-11-22 21:49:01.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (181, 76, 1, 1057, N'1072', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0001.gif"/></p>', CAST(N'2017-11-22 23:15:20.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (182, 76, 1, 1072, N'1057', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0052.gif"/></p>', CAST(N'2017-11-22 23:16:20.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (183, 29, 3, 1026, N'1072', N'<p>水电费</p>', CAST(N'2017-11-23 13:23:05.000' AS DateTime))
INSERT [dbo].[Tbl_Reply] ([replyId], [postId], [floor], [userId], [replyUser], [replyContent], [replyTime]) VALUES (184, 76, 1, 1072, N'1072', N'<p><br/><img src="http://img.baidu.com/hi/jx2/j_0013.gif"/></p>', CAST(N'2017-11-23 22:22:19.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Reply] OFF
SET IDENTITY_INSERT [dbo].[Tbl_User] ON 

INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1003, N'10086', N'妙心', N'10086', 12345, N'10086@qq.com', N'女         ', CAST(N'1997-09-08' AS Date), N'中国', N'pic_user/A.jpg', N'中国移动为你提供业务介绍，手机话费充值', CAST(N'2017-11-15 20:04:03.000' AS DateTime), N'116.223.2.4', 4, 23, 12343, 1, N'小白', N'169.168.1.2', CAST(N'2017-09-09 00:00:00.000' AS DateTime), CAST(N'2017-02-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1007, N'10010', N'唯唯诺诺', N'10010', 10010, N'10010@qq.com', N'女         ', CAST(N'1997-03-02' AS Date), N'中国', N'pic_user/B.jpg', N'联通 网上营业厅,冰激凌套餐卡,流量语音不限量', CAST(N'2017-02-05 00:00:00.000' AS DateTime), N'116.223.2.3', 6, 34, 543, 1, N'小白', N'159.143.133.34', CAST(N'2017-05-03 00:00:00.000' AS DateTime), CAST(N'2017-05-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1011, N'123423', N'夜上海', N'10000', 56987, N'56987@qq.com', N'女         ', CAST(N'1997-03-03' AS Date), N'上海', N'pic_user/C.jpg', N'“哇塞你好萌！”“嫌我矮就直说。”', CAST(N'2017-02-05 00:00:00.000' AS DateTime), N'116.223.2.3', 36, 256, 456, 4, N'酋魔', N'159.143.133.33', CAST(N'2017-05-04 00:00:00.000' AS DateTime), CAST(N'2017-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1015, N'232356', N'来生、一世', N'15632', 58963, N'58963@qq.com', N'男         ', CAST(N'1997-03-04' AS Date), N'西藏', N'pic_user/D.jpg', N'我有一个不追却特别喜欢的人,', CAST(N'2017-02-05 00:00:00.000' AS DateTime), N'116.223.2.3', 47, 230, 321, 3, N'上神', N'159.143.133.32', CAST(N'2017-05-05 00:00:00.000' AS DateTime), CAST(N'2017-05-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1017, N'789634', N'今生-不悔', N'78964', 25634, N'2563478@qq.com', N'男         ', CAST(N'1998-02-09' AS Date), N'中国', N'pic_user/E.jpg', N'妈妈再打我一次', CAST(N'2017-11-17 12:01:03.030' AS DateTime), N'	
116.252.152.155 -- 广西壮族自治区南宁市', 34, 43, 345, 1, N'小白', N'	
116.252.152.155 -- 广西壮族自治区南宁市', CAST(N'2017-12-17 13:02:00.000' AS DateTime), CAST(N'2017-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1018, N'856973', N'庇佑', N'23654', 36987, N'3698715@163.com', N'女         ', CAST(N'1998-02-09' AS Date), N'中国', N'pic_user/F.jpg', N'妈妈再打我一次', CAST(N'2017-11-17 00:00:00.000' AS DateTime), N'116.223.2.4', 23, 43, 345, 1, N'小白', N'115.23.23.23', CAST(N'2017-11-17 00:00:00.000' AS DateTime), CAST(N'2017-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1019, N'478961', N'阿西边', N'56533', 12580, N'12580@qq.com', N'女         ', CAST(N'1998-02-10' AS Date), N'贵港', N'pic_user/G.jpg', N'每个寝室都有一个打呼噜的,一个磨牙的,一个说梦话的,一个睡很晚纵观全场的.', CAST(N'2017-11-17 00:00:00.000' AS DateTime), N'116.223.2.4', 69, 25, 555, 2, N'小白', N'115.23.23.22', CAST(N'2017-11-12 00:00:00.000' AS DateTime), CAST(N'2017-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1020, N'853642', N'忻城', N'25789', 25698, N'25698@qq.com', N'男         ', CAST(N'1998-02-11' AS Date), N'南宁', N'pic_user/H.jpg', N'咎由自取的东西最后也不用谁可怜', CAST(N'2017-11-17 00:00:00.000' AS DateTime), N'116.223.2.6', 78, 65, 666, 3, N'大神', N'115.23.23.21', CAST(N'2017-11-03 00:00:00.000' AS DateTime), CAST(N'2017-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1021, N'123456', N'印度阿三', N'36983', 45631, N'45631@qq.com', N'男         ', CAST(N'1998-02-12' AS Date), N'柳州', N'pic_user/I.jpg', N'[ 时光带走的只会是各种品种的狗。]', CAST(N'2017-11-17 00:00:00.000' AS DateTime), N'116.23.66', 6, 45, 777, 5, N'总裁', N'115.23.23.20', CAST(N'2017-11-04 00:00:00.000' AS DateTime), CAST(N'2017-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1022, N'789012', N'RERERE', N'22297', 1609403959, N'1609403959@qq.com', N'女         ', CAST(N'1998-02-05' AS Date), N'美国', N'pic_user/J.jpg', N'统计信息', CAST(N'2017-02-07 14:21:00.000' AS DateTime), N'116.223.2.6', 3, 45, 488, 6, N'小白', N'169.168.1.4', CAST(N'2017-11-03 19:30:00.000' AS DateTime), CAST(N'2017-11-18 16:13:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1023, N'345678', N'MIUI活动君', N' 2233769204', 223376256, N'223376256@qq.com', N'男         ', CAST(N'1997-09-09' AS Date), N'美国', N'pic_user/K.jpg', N'现在还没有分享', CAST(N'2017-05-24 14:40:00.000' AS DateTime), N'116.23.69', 8, 50, 693, 2, N'大咖', N'169.21.35.2', CAST(N'2017-11-16 17:43:00.000' AS DateTime), CAST(N'2017-11-16 17:44:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1024, N'901234', N'永_恆', N'137006033', 123456789, N'54896@qq.com', N'女         ', CAST(N'1997-09-10' AS Date), N'美国', N'pic_user/L.jpg', N'厉害！您已经点亮了53个产品类图标：', CAST(N'2014-07-30 16:49:06.000' AS DateTime), N'116.23.66', 5, 36, 45, 4, N'小白', N'169.21.36.3', CAST(N'2017-11-13 20:47:36.000' AS DateTime), CAST(N'2017-11-18 06:13:07.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1025, N'567890', N'唯爱吾迪', N'137006034', 123456788, N'123456788@qq.com', N'女         ', CAST(N'1997-09-11' AS Date), N'香港', N'pic_user/M.jpg', N'玄冥', CAST(N'2017-09-09 15:31:00.000' AS DateTime), N'116.23.60', 4, 423, 416, 3, N'上神', N'169.21.37.4', CAST(N'2017-09-09 15:31:00.000' AS DateTime), CAST(N'2017-11-19 10:08:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1026, N'654321', N'东北的小五', N'137006035', 123456787, N'123456787@qq.com', N'男         ', CAST(N'1997-09-12' AS Date), N'台湾', N'pic_user/N.jpg', N'你没资格对我吹毛求疵背后乱嚼舌根 就算我有多差多烂 我没吃过你家一口饭', CAST(N'2017-06-20 10:05:00.000' AS DateTime), N'116.23.61', 6, 201, 175, 5, N'酋魔', N'169.21.38.5', CAST(N'2017-11-19 10:30:00.000' AS DateTime), CAST(N'2017-11-17 21:58:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1027, N'987654', N'顾洺。', N'137006036', 123456786, N'123456786@qq.com', N'女         ', CAST(N'1997-09-13' AS Date), N'日本', N'pic_user/O.jpg', N'一个真正陪他裸婚的人却输给了一个只是陪他演过裸婚的人', CAST(N'2016-02-13 18:05:00.000' AS DateTime), N'116.23.62', 7, 736, 640, 6, N'总裁', N'169.21.39.6', CAST(N'2017-10-29 12:05:00.000' AS DateTime), CAST(N'2017-11-16 21:23:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1028, N'234567', N'北海听风', N'137006037', 123456785, N'123456785@qq.com', N'男         ', CAST(N'1997-09-14' AS Date), N'中国', N'pic_user/P.jpg', N'一开始用的了  到后面点也没有反应了 求解', CAST(N'2017-07-12 11:53:00.000' AS DateTime), N'116.23.63', 4, 1318, 1310, 6, N'大神', N'169.21.40.7', CAST(N'2017-10-06 12:17:00.000' AS DateTime), CAST(N'2017-11-19 09:19:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1029, N'890123', N'summer4869', N'137006038', 123456784, N'123456784@qq.com', N'男         ', CAST(N'1997-09-15' AS Date), N'南京', N'pic_user/Q.jpg', N'听说搜狗会上传用户的隐私数据，明文上传，小米版的搜狗输入法能保证安全吗？隐私能保证吗？
', CAST(N'2017-02-27 14:47:00.000' AS DateTime), N'116.23.64', 36, 7469, 7221, 9, N'上神', N'169.21.41.8', CAST(N'2017-08-20 11:24:00.000' AS DateTime), CAST(N'2017-11-19 08:20:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1030, N'456789', N'《小夏》', N'137006039', 123456783, N'123456783@qq.com', N'男         ', CAST(N'1997-09-16' AS Date), N'江西', N'pic_user/R.jpg', N'“弱水三千只取一瓢是什么意思？” “就是整组的作业我只抄她的”', CAST(N'2014-02-24 11:49:00.000' AS DateTime), N'116.23.66', 56, 1102, 955, 6, N'小白', N'169.21.42.9', CAST(N'2017-11-19 08:20:00.000' AS DateTime), CAST(N'2017-11-19 08:20:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1034, N'234567', N'潋∶深沉', N'137006040', 123456782, N'123456782@qq.com', N'女         ', CAST(N'1997-09-17' AS Date), N'武昌', N'pic_user/S.jpg', N'隐身的人回复你，说明她不曾远离你。', CAST(N'2016-12-26 08:02:00.000' AS DateTime), N'116.23.67', 12, 479, 432, 7, N'大咖', N'169.21.43.0', CAST(N'2017-08-28 19:32:00.000' AS DateTime), CAST(N'2017-11-19 09:37:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1035, N'345679', N'吉尔伽•美什', N'137006041', 123456781, N'123456781@qq.com', N'男         ', CAST(N'1997-09-18' AS Date), N'南昌', N'pic_user/T.jpg', N'上课走神三大理由：你手里有个手机你心里有个傻逼 你旁边有个逗比', CAST(N'2016-07-30 11:11:00.000' AS DateTime), N'116.23.68', 69, 1441, 1301, 8, N'小白', N'169.21.45.3', CAST(N'2017-10-24 19:36:00.000' AS DateTime), CAST(N'2017-11-19 00:22:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1036, N'561237', N'花花ฅ', N'137006042', 123456780, N'123456780@qq.com', N'男         ', CAST(N'1997-09-19' AS Date), N'南宁', N'pic_user/U.jpg', N'最看不惯那些说话装嗲、走路往死里扭、还特么在女生面前装刁、在男生面前一副楚楚可怜样的女生。', CAST(N'2017-06-27 19:38:00.000' AS DateTime), N'116.23.65', 21, 103, 147, 6, N'小白', N'169.21.45.34', CAST(N'2017-08-18 17:01:00.000' AS DateTime), CAST(N'2017-11-19 01:55:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1037, N'369874', N'晴空小猪', N'137006043', 123456779, N'123456779@qq.com', N'女         ', CAST(N'1997-09-20' AS Date), N'新疆', N'pic_user/V.jpg', N'放学到家，扔下书包，狂奔到这个房间，插上插销，开机。用时7秒堪称完美~~~', CAST(N'2011-11-29 10:09:00.000' AS DateTime), N'116.23.56', 41, 47047, 35807, 7, N'大咖', N'169.21.45.33', CAST(N'2017-08-22 16:56:00.000' AS DateTime), CAST(N'2016-02-24 08:36:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1038, N'896324', N'ultraman45', N'137006044', 123456778, N'123456780@qq.com', N'女         ', CAST(N'1997-09-21' AS Date), N'四川', N'pic_user/W.jpg', N'没动力的时候我就会想到你的笑。', CAST(N'2013-04-23 18:06:00.000' AS DateTime), N'116.23.45', 32, 1071, 1027, 5, N'小白', N'169.21.45.22', CAST(N'2017-08-29 09:10:00.000' AS DateTime), CAST(N'2017-11-19 11:10:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1039, N'796345', N'忻悦情怀', N'137006045', 123456777, N'123456777@qq.com', N'女         ', CAST(N'1997-09-22' AS Date), N'厦门', N'pic_user/X.jpg', N'法国有句谚语：爱人在身旁，处处是天堂。', CAST(N'2017-10-13 17:00:00.000' AS DateTime), N'116.23.31', 78, 996, 974, 4, N'小白', N'169.21.45.12', CAST(N'2017-11-18 21:28:00.000' AS DateTime), CAST(N'2017-11-19 11:08:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1040, N'563219', N'猪肉王子i', N'137006046', 123456776, N'123456776@qq.com', N'男         ', CAST(N'1997-09-23' AS Date), N'东京', N'pic_user/Y.jpg', N'每个人心底都有那么一个人，已不是恋人，也成不了朋友。', CAST(N'2015-08-26 17:53:00.000' AS DateTime), N'116.23.63', 45, 846, 797, 6, N'大咖', N'169.21.45.02', CAST(N'2017-09-02 21:27:00.000' AS DateTime), CAST(N'2017-11-18 12:23:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1041, N'4443', N'大摆裙', N'1333244', 34422322, N'1333244', N'男         ', CAST(N'1994-02-13' AS Date), N'南昌', N'pic_user/11.jpg', N'现在还没有动态', CAST(N'2014-07-14 00:00:00.000' AS DateTime), N'22.223.56.54', 45, 343, 344, 5, N'大师', N'169.21.45.02', CAST(N'2017-07-12 00:00:00.000' AS DateTime), CAST(N'2017-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1042, N'32156', N'小王子', N'288364', 1299823, N'1664532', N'女         ', CAST(N'1993-08-23' AS Date), N'梧州', N'pic_user/12.jpg', N'保密', CAST(N'2013-08-03 00:00:00.000' AS DateTime), N'22.223.56.56', 34, 67, 334, 5, N'大神', N'22.223.56.57', CAST(N'2017-04-03 00:00:00.000' AS DateTime), CAST(N'2017-04-23 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1043, N'44323', N'大玉米', N'777434', 1886773, N'777434', N'女         ', CAST(N'1998-04-05' AS Date), N'南京', N'pic_user/13.jpg', N'我命由我不由天', CAST(N'2017-06-27 19:38:00.000' AS DateTime), N'22.223.56.58', 54, 76, 443, 6, N'新手', N'22.223.53.57', CAST(N'2017-06-03 00:00:00.000' AS DateTime), CAST(N'2017-08-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1044, N'554', N'黄瓜', N'34422', 1889845, N'34422', N'男         ', CAST(N'1998-06-12' AS Date), N'柳州', N'pic_user/14.jpg', N'哈哈哈哈哈哈', CAST(N'2017-08-27 19:38:00.000' AS DateTime), N'33.45.223.44', 65, 45, 665, 4, N'传说', N'44.33.66.65', CAST(N'2013-06-23 00:00:00.000' AS DateTime), CAST(N'2013-06-23 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1045, N'7723', N'大兵', N'33443', 29984, N'33443', N'男         ', CAST(N'1985-09-04' AS Date), N'成都', N'pic_user/15.jpg', N'啦啦啦啦啦', CAST(N'2017-12-27 19:38:00.000' AS DateTime), N'12.32.43.54', 56, 34, 664, 4, N'大师', N'34.43.55.34', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1046, N'443', N'浩南', N'33232', 334423, N'34343', N'女         ', CAST(N'1992-04-05' AS Date), N'贵州', N'pic_user/16.jpg', N'吸猫吗', CAST(N'2017-08-27 19:38:00.000' AS DateTime), N'232.32.32.4', 34, 55, 664, 6, N'大师', N'34.342.3.2', CAST(N'2017-08-27 19:38:00.000' AS DateTime), CAST(N'2017-08-27 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1047, N'4432', N'西乡塘扛把子', N'5343', 34345, N'867', N'男         ', CAST(N'1972-05-05' AS Date), N'贵阳', N'pic_user/17.jpg', N'双击66666', CAST(N'2015-08-24 00:00:00.000' AS DateTime), N'75.45.46.45', 34, 54, 656, 4, N'大师', N'43.34.54.5', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-12-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1048, N'54544', N'闪现开大', N'343', 5454, N'343', N'女         ', CAST(N'1985-05-06' AS Date), N'桂平', N'pic_user/18.jpg', N'情热大陆上的狗', CAST(N'2016-08-24 00:00:00.000' AS DateTime), N'545.34.343.3', 45, 45, 34, 6, N'新手', N'54.45.4.3', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1049, N'66666', N'馅饼', N'65654', 54543, N'6565654', N'男         ', CAST(N'1992-04-03' AS Date), N'天津', N'pic_user/19.jpg', N'呵呵', CAST(N'2017-08-27 19:38:00.000' AS DateTime), N'54.434.5.6', 65, 87, 67, 7, N'大师', N'54.45.4.67', CAST(N'2017-08-26 19:38:00.000' AS DateTime), CAST(N'2017-08-27 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1050, N'645', N'傻瓜', N'665489', 65634, N'54546', N'女         ', CAST(N'1996-05-24' AS Date), N'北京', N'pic_user/20.jpg', N'傻逼吗', CAST(N'2015-08-24 00:00:00.000' AS DateTime), N'645.75.65.7', 34, 53, 34, 8, N'小白', N'77.6.45.6', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1051, N'98889', N'和江门', N'45478', 67676, N'76765', N'男         ', CAST(N'1998-04-25' AS Date), N'南宁', N'pic_user/21.jpg', N'报道，拜见各位大大，很高兴认识大家', CAST(N'2016-08-14 00:00:00.000' AS DateTime), N'5.54.654.6', 54, 545, 34, 9, N'大神', N'32.43.5.34', CAST(N'2016-08-24 00:00:00.000' AS DateTime), CAST(N'2016-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1052, N'54534', N'胡晓兵', N'5454', 3434, N'4545', N'女         ', CAST(N'2002-04-05' AS Date), N'上海', N'pic_user/22.jpg', N'现在还没有分享', CAST(N'2017-10-27 19:38:00.000' AS DateTime), N'43.54.6.7', 24, 323, 4354, 8, N'小白', N'32.234.43.5', CAST(N'2016-08-24 00:00:00.000' AS DateTime), CAST(N'2016-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1053, N'5777', N'王路飞', N'6545', 45345, N'3434', N'女         ', CAST(N'1992-04-05' AS Date), N'惠州', N'pic_user/23.jpg', N'头要炸了', CAST(N'2015-04-24 00:00:00.000' AS DateTime), N'43.54.64.7', 54, 543, 434, 9, N'小白', N'545.45.54.34', CAST(N'2016-08-24 00:00:00.000' AS DateTime), CAST(N'2016-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1054, N'7878', N'狐狸精', N'343', 43434, N'43434', N'男         ', CAST(N'1992-04-05' AS Date), N'惠阳', N'pic_user/24.jpg', N'什么都没有', CAST(N'2016-08-24 00:00:00.000' AS DateTime), N'53.64.65.7', 23, 534, 545, 5, N'新手', N'34.34.64.54', CAST(N'2017-08-27 19:38:00.000' AS DateTime), CAST(N'2017-08-27 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1055, N'989898', N'胡杨', N'897', 7879, N'7879', N'男         ', CAST(N'1997-02-25' AS Date), N'钦州', N'pic_user/25.jpg', N'一条狗', CAST(N'2016-08-24 00:00:00.000' AS DateTime), N'54.45.65.7', 34, 34, 535, 9, N'传说', N'34.34.653.3', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1056, N'67576', N'虎哥', N'97808', 7878, N'797', N'女         ', CAST(N'1996-08-05' AS Date), N'广州', N'pic_user/26.jpg', N'曾经回不去', CAST(N'2015-08-24 00:00:00.000' AS DateTime), N'6.56.5.45', 54, 53, 34, 5, N'大神', N'34.234.53.6', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1057, N'666', N'666', N'666', 9897, N'3435', N'男         ', CAST(N'1982-04-26' AS Date), N'深圳', N'/pic_user/68b51772-f8bf-4432-a6ae-9e752ef6c683.jpg', N'回家！！', CAST(N'2016-08-24 00:00:00.000' AS DateTime), N'54.54.64.5', 65, 17, 88, 7, N'小白', N'116.252.154.0 -- 广西壮族自治区南宁市', CAST(N'2017-11-23 22:35:06.000' AS DateTime), CAST(N'2017-11-23 22:39:01.193' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1058, N'989898', N'你爸爸', N'5353', 6453, N'54546', N'男         ', CAST(N'1979-09-27' AS Date), N'深圳', N'pic_user/28.jpg', N'时间会证明的', CAST(N'2015-08-24 00:00:00.000' AS DateTime), N'343.53.54.64', 34, 53, 535, 5, N'大神', N'343.6.65.7', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1059, N'6767', N'系统提示', N'545', 3535, N'3535', N'女         ', CAST(N'1989-05-18' AS Date), N'武汉', N'pic_user/29.jpg', N'忘了他吧，我偷电车养你', CAST(N'2016-08-24 00:00:00.000' AS DateTime), N'23.34.35.23', 34, 34, 3434, 3, N'小白', N'343.53.43.5', CAST(N'2016-08-24 00:00:00.000' AS DateTime), CAST(N'2016-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1060, N'3434', N'空白', N'3434', 545, N'635', N'男         ', CAST(N'1992-04-05' AS Date), N'昆明', N'pic_user/30.jpg', N'近距离靠近', CAST(N'2017-08-27 19:38:00.000' AS DateTime), N'34.43.64.6', 34, 534, 34, 5, N'大神', N'343.545.645.4', CAST(N'2017-08-27 19:38:00.000' AS DateTime), CAST(N'2017-08-27 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1061, N'3434', N'马钰', N'343', 4345, N'435', N'男         ', CAST(N'1992-04-05' AS Date), N'南昌', N'pic_user/31.jpg', N'唐红山小马林', CAST(N'2016-08-24 00:00:00.000' AS DateTime), N'86.7.6.56', 54, 85, 45, 7, N'小白', N'78.45.75.7', CAST(N'2016-08-24 00:00:00.000' AS DateTime), CAST(N'2016-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1062, N'54645', N'[  ]', N'5454', 4546, N'9898', N'女         ', CAST(N'1998-08-13' AS Date), N'厦门', N'pic_user/32.jpg', N'一个被商业耽误的戏骨, 演起戏来还是很帅的嘛', CAST(N'2017-08-27 19:38:00.000' AS DateTime), N'98.54.3.5', 34, 54, 87, 5, N'大神', N'34.64.6.4', CAST(N'2017-08-27 19:38:00.000' AS DateTime), CAST(N'2017-08-27 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1063, N'7874', N'tony', N'78776', 9793, N'89798', N'男         ', CAST(N'1999-04-29' AS Date), N'成都', N'pic_user/33.jpg', N'软韧舒适，质感细腻光泽，经久耐穿，时尚百搭。', CAST(N'2015-08-24 00:00:00.000' AS DateTime), N'56.6.54.7', 54, 76, 65, 65, N'小白', N'34.64.64.6', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1064, N'53453', N'花花', N'5344', 646, N'5454', N'女         ', CAST(N'1998-08-13' AS Date), N'南京', N'pic_user/34.jpg', N'http://www.miui.com/index.php?517724 ', CAST(N'2017-08-27 19:38:00.000' AS DateTime), N'87.4.54.64', 98, 34, 98, 34, N'大神', N'98.3.43.4', CAST(N'2017-08-27 19:38:00.000' AS DateTime), CAST(N'2017-08-27 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1065, N'979797', N'程咬金', N'9797', 787, N'680', N'男         ', CAST(N'1998-09-07' AS Date), N'佛山', N'pic_user/35.jpg', N'我一条狗吃饭旅行', CAST(N'2016-08-24 00:00:00.000' AS DateTime), N'87.98.54.3', 76, 97, 79, 7, N'新手', N'87.8.3.5', CAST(N'2016-08-24 00:00:00.000' AS DateTime), CAST(N'2016-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1066, N'78988', N'我爱腾讯', N'977878', 68696, N'78686', N'男         ', CAST(N'1998-08-13' AS Date), N'厦门', N'pic_user/36.jpg', N'老龄化社会该何去何从', CAST(N'2017-08-27 19:38:00.000' AS DateTime), N'87.3.53.6', 87, 97, 878, 7, N'小白', N'73.53.64.54', CAST(N'2017-08-27 19:38:00.000' AS DateTime), CAST(N'2017-08-27 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1067, N'78977', N'玻璃心', N'7878', 87879, N'68686', N'女         ', CAST(N'1999-04-29' AS Date), N'福建', N'pic_user/37.jpg', N'计量经济学', CAST(N'2016-08-24 00:00:00.000' AS DateTime), N'89.79.6.79', 79, 67, 689, 6, N'小白', N'78.57.99.68', CAST(N'2016-08-24 00:00:00.000' AS DateTime), CAST(N'2016-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1068, N'76557', N'马冬梅', N'79789', 787, N'787', N'女         ', CAST(N'1994-03-08' AS Date), N'广州', N'pic_user/38.jpg', N'被举报了，风险提示请无视', CAST(N'2015-08-24 00:00:00.000' AS DateTime), N'89.6.34.5', 98, 77, 78, 7, N'大神', N'98.3.43.3', CAST(N'2015-08-24 00:00:00.000' AS DateTime), CAST(N'2015-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1069, N'7877', N'你已被一出群聊', N'7797', 7988, N'7979', N'男         ', CAST(N'1999-08-29' AS Date), N'昆明', N'pic_user/39.jpg', N'这个人很懒，什么都没留下', CAST(N'2016-06-19 00:00:00.000' AS DateTime), N'89.68.68.8', 68, 68, 68, 9, N'传说', N'116.252.157.169 -- 广西壮族自治区南宁市', CAST(N'2017-11-22 23:17:23.000' AS DateTime), CAST(N'2016-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1070, N'8989', N'丞相', N'880', 79898, N'7997', N'女         ', CAST(N'1998-08-13' AS Date), N'北京', N'pic_user/40.jpg', N'。。。。。。。。。', CAST(N'2014-11-24 19:38:00.000' AS DateTime), N'98.77.7.98', 76, 76, 89, 9, N'小白', N'244.23.42.54', CAST(N'2014-11-24 19:38:00.000' AS DateTime), CAST(N'2014-11-24 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1071, N'898', N'王司徒', N'8989', 8988, N'898', N'男         ', CAST(N'1999-08-29' AS Date), N'南宁', N'pic_user/41.jpg', N'该怎么做才好', CAST(N'2017-08-27 19:38:00.000' AS DateTime), N'98.34.53.4', 87, 78, 87, 7, N'小白', N'83.43.5.53', CAST(N'2017-08-27 19:38:00.000' AS DateTime), CAST(N'2017-08-27 19:38:00.000' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1072, N'1', N'1', N'1', NULL, N'1234@QQ', NULL, NULL, NULL, N'/pic_user/53905abc-6000-42cd-bc14-5d2ecaaddf4c.jpg', NULL, CAST(N'2017-11-20 19:31:54.000' AS DateTime), N'116.252.158.247 -- 广西壮族自治区南宁市', 16, 100, 171, 6, N'菜鸟', N'116.252.154.0 -- 广西壮族自治区南宁市', CAST(N'2017-11-23 22:23:59.000' AS DateTime), CAST(N'2017-11-23 22:35:06.423' AS DateTime))
INSERT [dbo].[Tbl_User] ([UID], [password], [userName], [phoneNum], [qqNum], [email], [sex], [birthday], [address], [headPortrait], [qianming], [registrationTime], [registerIP], [signInNum], [signInPoints], [empiricValue], [grade], [positi], [ipAddress], [loginTime], [oldLoginTime]) VALUES (1073, N'11', N'11', NULL, NULL, N'11@qq.com', NULL, NULL, NULL, N'pic_user/default.jpg', NULL, CAST(N'2017-11-21 23:13:31.000' AS DateTime), N'116.252.152.209 -- 广西壮族自治区南宁市', 0, 0, 0, 1, N'小白', N'113.12.143.123 -- 广西壮族自治区南宁市', CAST(N'2017-11-21 23:44:36.000' AS DateTime), CAST(N'2017-11-21 23:25:14.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tbl_Admin]    Script Date: 2017/11/23 22:47:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tbl_Admin] ON [dbo].[Tbl_Admin]
(
	[adminstrator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tbl_Forums]    Script Date: 2017/11/23 22:47:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tbl_Forums] ON [dbo].[Tbl_Forums]
(
	[forumTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tbl_Post]    Script Date: 2017/11/23 22:47:01 ******/
CREATE NONCLUSTERED INDEX [IX_Tbl_Post] ON [dbo].[Tbl_Post]
(
	[forumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tbl_Reply]    Script Date: 2017/11/23 22:47:01 ******/
CREATE NONCLUSTERED INDEX [IX_Tbl_Reply] ON [dbo].[Tbl_Reply]
(
	[replyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Table_UserName]    Script Date: 2017/11/23 22:47:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_UserName] ON [dbo].[Tbl_User]
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Pic]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Pic_Tbl_Post] FOREIGN KEY([postId])
REFERENCES [dbo].[Tbl_Post] ([postId])
GO
ALTER TABLE [dbo].[Tbl_Pic] CHECK CONSTRAINT [FK_Tbl_Pic_Tbl_Post]
GO
ALTER TABLE [dbo].[Tbl_Post]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Post_Tbl_Forums] FOREIGN KEY([forumId])
REFERENCES [dbo].[Tbl_Forums] ([forumId])
GO
ALTER TABLE [dbo].[Tbl_Post] CHECK CONSTRAINT [FK_Tbl_Post_Tbl_Forums]
GO
ALTER TABLE [dbo].[Tbl_Post]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Post_Tbl_User1] FOREIGN KEY([UID])
REFERENCES [dbo].[Tbl_User] ([UID])
GO
ALTER TABLE [dbo].[Tbl_Post] CHECK CONSTRAINT [FK_Tbl_Post_Tbl_User1]
GO
ALTER TABLE [dbo].[Tbl_Reply]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Reply_Tbl_Post] FOREIGN KEY([postId])
REFERENCES [dbo].[Tbl_Post] ([postId])
GO
ALTER TABLE [dbo].[Tbl_Reply] CHECK CONSTRAINT [FK_Tbl_Reply_Tbl_Post]
GO
ALTER TABLE [dbo].[Tbl_Reply]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Reply_Tbl_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Tbl_User] ([UID])
GO
ALTER TABLE [dbo].[Tbl_Reply] CHECK CONSTRAINT [FK_Tbl_Reply_Tbl_User]
GO
USE [master]
GO
ALTER DATABASE [risingwindbbs] SET  READ_WRITE 
GO

-----------------------------------------------------------------------------
-- Belial web waf
-- Author: 逆雪寒
-- Copyright (c) 2013 半夜三更
-- 
-- 安装说明
-- 
-- 
-----------------------------------------------------------------------------

local Conf = {
-----------------------------------------------------------------------------
-- 全局选项

	belialFileLogPath = "/data/belial/cake/log.belial", --  日志的目录，所有的错误信息和攻击拦截信息所在
	isBackend = true, -- 如果 belial waf 位于后端 那就true。否则获得的请求IP不准确
	attackHtmlPageName = "/data/belial/me.html", --自定义拦截页面 文件路径  例如:/data/belial.html
	regularRule = "ziqing", -- regularRule.lua 规则文件里面的规则名字
	
	allowIpAccess = {"11.1.86.4","28.65.24.18"}, --不受拦截ip
	alloAccessSpidersIp = {}, --允许的蜘蛛IP
	denyIPAccess = "/data/belial/denyAccess.ip",--被禁止的IP访问列表
	globaldenyIpNgxShareDictExptimeSecond = 3600,  --cc攻击和自动deny模式下的被拦截IP的有效期 单位秒
	
	toLog = "On", -- 攻击信息是否纪录到日志文件
	
	cookieMatch = "On",  -- 是否对cookie进行关键字匹配判断
	postMatch   = "On",   -- 是否对post请求进行关键字匹配判断
	whiteModule = "On", -- post白名单模块 是否开启
	ngxPathInfoFixModule = "On",  --nginx 畸形路径解释防御
	autoDenyIpModule = "On", --自动拦截：根据攻击次数进行拦截 On 开启   Off关闭
	ccGlobalLog = "On", --cc全局记录模块
	ccMatch = "On", --是否开启CC防御
	

-----------------------------------------------------------------------------
--文件上传模块

	notAllowUploadFileExtension = {".php"}, --不允许上传的扩展名
	
-----------------------------------------------------------------------------	
--	post白名单模块
--	是否开启收集,可以先开启 收集个几天，然后获得大部分得post白名单之后再关闭。
--	注意：只有 whiteModule = "On" 和 getTogether = "Off" 后 白名单拦截机制才正式启动

	getTogether = "Off",
	
	webProjectRootDirectory = "/data/www/ting", --你网站的www目录(根目录) *记得不带斜杠(/)
	allowAccessPostFilePath = "/data/belial/allow.belial", -- 白名单,一个记录一行
	rejectPostLogPath = "/data/belial/cake/reject.belial", -- post被拦截的记录
	
-------------------------------------------------------------------------------
-- 自动拦截：根据攻击次数进行拦截
-- 
	attackAmount = 10, --HACK次数
	autoDenyIpValidSecond = 86400, --被禁止IP多久 秒单位   0 就使用全局设置 globaldenyIpNgxShareDictExptimeSecond
	autoDenyRuleExptimeSecond = 86400, -- 规则存在的有效时间 秒单位
	
-----------------------------------------------------------------------------
-- cc全局记录模块
	
	ccGlobalAmount = 240, --每秒多少次就进行记录
	ccGloablLogPath = "/data/belial/cake/log.ccGlobal",
	ccGlobalRuleExptimeSecond = 60, --动态规则有效时间
	
-- cc攻击防御模块

	ccDebug = "On", --建议开启cc防御前
	ccDebugRequestAmount = 60, --调试模式下每秒请求数
	ccDebugLogPath = "/data/belial/cake/log.ccDebug", -- 留空就核心日志里
	
	ccDenyIpValidSecond = 36400, --被禁止IP多久 秒单位   0 就使用全局设置 globaldenyIpNgxShareDictExptimeSecond
	ccDenyTagExptimeSecond = 60 -- 动态规则存在的有效时间  秒为单位 *默认就行
}

return Conf

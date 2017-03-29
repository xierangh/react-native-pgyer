# react-native-pgyer
react-native-pgyer 更新
#依赖
npm install react-native-pgyer --save
#链接
react-native link react-native-pgyer
#使用
import Pgyer from 'react-native-pgyer'
//查询最新版本号
Pgyger.updateVersion();
//获得版本号
var versioncode = Pgyer.getVersion();
Alert("versioncode",versioncode);
//下载
Pgyer.download();

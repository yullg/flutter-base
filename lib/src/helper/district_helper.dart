import 'dart:convert';

import '../bean/district.dart';

class DistrictHelper {
  static final List<District> _districts =
      List<District>.unmodifiable(jsonDecode(json).map((e) => District(
            id: e["id"],
            pid: e["pid"],
            level: e["level"],
            name: e["name"] ?? e["fullname"],
            fullname: e["fullname"] ?? e["name"],
          )));

  static get districts => _districts;

  static District? findDistrict(String? id) {
    if (id != null) {
      for (District district in _districts) {
        if (district.id == id) return district;
      }
    }
    return null;
  }

  static bool hasSubDistrict(String? pid) {
    return _districts.any((district) => district.pid == pid);
  }

  static List<District> subDistricts(String? pid) {
    return _districts.where((district) => district.pid == pid).toList();
  }

  static String? fullyQualifiedName(String? id, {bool useFullname = false}) {
    if (id == null) return null;
    District? district = findDistrict(id);
    if (district == null) return null;
    String? pname = fullyQualifiedName(district.pid, useFullname: useFullname);
    return (pname ?? "") + (useFullname ? district.fullname : district.name);
  }

  DistrictHelper._();
}

final json = r'''
[ {
  "level" : 1,
  "name" : "北京",
  "pid" : null,
  "id" : "110000",
  "fullname" : "北京市"
}, {
  "level" : 1,
  "name" : "天津",
  "pid" : null,
  "id" : "120000",
  "fullname" : "天津市"
}, {
  "level" : 1,
  "name" : "河北",
  "pid" : null,
  "id" : "130000",
  "fullname" : "河北省"
}, {
  "level" : 1,
  "name" : "山西",
  "pid" : null,
  "id" : "140000",
  "fullname" : "山西省"
}, {
  "level" : 1,
  "name" : "内蒙古",
  "pid" : null,
  "id" : "150000",
  "fullname" : "内蒙古自治区"
}, {
  "level" : 1,
  "name" : "辽宁",
  "pid" : null,
  "id" : "210000",
  "fullname" : "辽宁省"
}, {
  "level" : 1,
  "name" : "吉林",
  "pid" : null,
  "id" : "220000",
  "fullname" : "吉林省"
}, {
  "level" : 1,
  "name" : "黑龙江",
  "pid" : null,
  "id" : "230000",
  "fullname" : "黑龙江省"
}, {
  "level" : 1,
  "name" : "上海",
  "pid" : null,
  "id" : "310000",
  "fullname" : "上海市"
}, {
  "level" : 1,
  "name" : "江苏",
  "pid" : null,
  "id" : "320000",
  "fullname" : "江苏省"
}, {
  "level" : 1,
  "name" : "浙江",
  "pid" : null,
  "id" : "330000",
  "fullname" : "浙江省"
}, {
  "level" : 1,
  "name" : "安徽",
  "pid" : null,
  "id" : "340000",
  "fullname" : "安徽省"
}, {
  "level" : 1,
  "name" : "福建",
  "pid" : null,
  "id" : "350000",
  "fullname" : "福建省"
}, {
  "level" : 1,
  "name" : "江西",
  "pid" : null,
  "id" : "360000",
  "fullname" : "江西省"
}, {
  "level" : 1,
  "name" : "山东",
  "pid" : null,
  "id" : "370000",
  "fullname" : "山东省"
}, {
  "level" : 1,
  "name" : "河南",
  "pid" : null,
  "id" : "410000",
  "fullname" : "河南省"
}, {
  "level" : 1,
  "name" : "湖北",
  "pid" : null,
  "id" : "420000",
  "fullname" : "湖北省"
}, {
  "level" : 1,
  "name" : "湖南",
  "pid" : null,
  "id" : "430000",
  "fullname" : "湖南省"
}, {
  "level" : 1,
  "name" : "广东",
  "pid" : null,
  "id" : "440000",
  "fullname" : "广东省"
}, {
  "level" : 1,
  "name" : "广西",
  "pid" : null,
  "id" : "450000",
  "fullname" : "广西壮族自治区"
}, {
  "level" : 1,
  "name" : "海南",
  "pid" : null,
  "id" : "460000",
  "fullname" : "海南省"
}, {
  "level" : 1,
  "name" : "重庆",
  "pid" : null,
  "id" : "500000",
  "fullname" : "重庆市"
}, {
  "level" : 1,
  "name" : "四川",
  "pid" : null,
  "id" : "510000",
  "fullname" : "四川省"
}, {
  "level" : 1,
  "name" : "贵州",
  "pid" : null,
  "id" : "520000",
  "fullname" : "贵州省"
}, {
  "level" : 1,
  "name" : "云南",
  "pid" : null,
  "id" : "530000",
  "fullname" : "云南省"
}, {
  "level" : 1,
  "name" : "西藏",
  "pid" : null,
  "id" : "540000",
  "fullname" : "西藏自治区"
}, {
  "level" : 1,
  "name" : "陕西",
  "pid" : null,
  "id" : "610000",
  "fullname" : "陕西省"
}, {
  "level" : 1,
  "name" : "甘肃",
  "pid" : null,
  "id" : "620000",
  "fullname" : "甘肃省"
}, {
  "level" : 1,
  "name" : "青海",
  "pid" : null,
  "id" : "630000",
  "fullname" : "青海省"
}, {
  "level" : 1,
  "name" : "宁夏",
  "pid" : null,
  "id" : "640000",
  "fullname" : "宁夏回族自治区"
}, {
  "level" : 1,
  "name" : "新疆",
  "pid" : null,
  "id" : "650000",
  "fullname" : "新疆维吾尔自治区"
}, {
  "level" : 1,
  "name" : "台湾",
  "pid" : null,
  "id" : "710000",
  "fullname" : "台湾省"
}, {
  "level" : 1,
  "name" : "香港",
  "pid" : null,
  "id" : "810000",
  "fullname" : "香港特别行政区"
}, {
  "level" : 1,
  "name" : "澳门",
  "pid" : null,
  "id" : "820000",
  "fullname" : "澳门特别行政区"
}, {
  "level" : 2,
  "name" : "东城",
  "pid" : "110000",
  "id" : "110101",
  "fullname" : "东城区"
}, {
  "level" : 2,
  "name" : "西城",
  "pid" : "110000",
  "id" : "110102",
  "fullname" : "西城区"
}, {
  "level" : 2,
  "name" : "朝阳",
  "pid" : "110000",
  "id" : "110105",
  "fullname" : "朝阳区"
}, {
  "level" : 2,
  "name" : "丰台",
  "pid" : "110000",
  "id" : "110106",
  "fullname" : "丰台区"
}, {
  "level" : 2,
  "name" : "石景山",
  "pid" : "110000",
  "id" : "110107",
  "fullname" : "石景山区"
}, {
  "level" : 2,
  "name" : "海淀",
  "pid" : "110000",
  "id" : "110108",
  "fullname" : "海淀区"
}, {
  "level" : 2,
  "name" : "门头沟",
  "pid" : "110000",
  "id" : "110109",
  "fullname" : "门头沟区"
}, {
  "level" : 2,
  "name" : "房山",
  "pid" : "110000",
  "id" : "110111",
  "fullname" : "房山区"
}, {
  "level" : 2,
  "name" : "通州",
  "pid" : "110000",
  "id" : "110112",
  "fullname" : "通州区"
}, {
  "level" : 2,
  "name" : "顺义",
  "pid" : "110000",
  "id" : "110113",
  "fullname" : "顺义区"
}, {
  "level" : 2,
  "name" : "昌平",
  "pid" : "110000",
  "id" : "110114",
  "fullname" : "昌平区"
}, {
  "level" : 2,
  "name" : "大兴",
  "pid" : "110000",
  "id" : "110115",
  "fullname" : "大兴区"
}, {
  "level" : 2,
  "name" : "怀柔",
  "pid" : "110000",
  "id" : "110116",
  "fullname" : "怀柔区"
}, {
  "level" : 2,
  "name" : "平谷",
  "pid" : "110000",
  "id" : "110117",
  "fullname" : "平谷区"
}, {
  "level" : 2,
  "name" : "密云",
  "pid" : "110000",
  "id" : "110118",
  "fullname" : "密云区"
}, {
  "level" : 2,
  "name" : "延庆",
  "pid" : "110000",
  "id" : "110119",
  "fullname" : "延庆区"
}, {
  "level" : 2,
  "name" : "和平",
  "pid" : "120000",
  "id" : "120101",
  "fullname" : "和平区"
}, {
  "level" : 2,
  "name" : "河东",
  "pid" : "120000",
  "id" : "120102",
  "fullname" : "河东区"
}, {
  "level" : 2,
  "name" : "河西",
  "pid" : "120000",
  "id" : "120103",
  "fullname" : "河西区"
}, {
  "level" : 2,
  "name" : "南开",
  "pid" : "120000",
  "id" : "120104",
  "fullname" : "南开区"
}, {
  "level" : 2,
  "name" : "河北",
  "pid" : "120000",
  "id" : "120105",
  "fullname" : "河北区"
}, {
  "level" : 2,
  "name" : "红桥",
  "pid" : "120000",
  "id" : "120106",
  "fullname" : "红桥区"
}, {
  "level" : 2,
  "name" : "东丽",
  "pid" : "120000",
  "id" : "120110",
  "fullname" : "东丽区"
}, {
  "level" : 2,
  "name" : "西青",
  "pid" : "120000",
  "id" : "120111",
  "fullname" : "西青区"
}, {
  "level" : 2,
  "name" : "津南",
  "pid" : "120000",
  "id" : "120112",
  "fullname" : "津南区"
}, {
  "level" : 2,
  "name" : "北辰",
  "pid" : "120000",
  "id" : "120113",
  "fullname" : "北辰区"
}, {
  "level" : 2,
  "name" : "武清",
  "pid" : "120000",
  "id" : "120114",
  "fullname" : "武清区"
}, {
  "level" : 2,
  "name" : "宝坻",
  "pid" : "120000",
  "id" : "120115",
  "fullname" : "宝坻区"
}, {
  "level" : 2,
  "name" : "滨海",
  "pid" : "120000",
  "id" : "120116",
  "fullname" : "滨海新区"
}, {
  "level" : 2,
  "name" : "宁河",
  "pid" : "120000",
  "id" : "120117",
  "fullname" : "宁河区"
}, {
  "level" : 2,
  "name" : "静海",
  "pid" : "120000",
  "id" : "120118",
  "fullname" : "静海区"
}, {
  "level" : 2,
  "name" : "蓟州",
  "pid" : "120000",
  "id" : "120119",
  "fullname" : "蓟州区"
}, {
  "level" : 2,
  "name" : "石家庄",
  "pid" : "130000",
  "id" : "130100",
  "fullname" : "石家庄市"
}, {
  "level" : 2,
  "name" : "唐山",
  "pid" : "130000",
  "id" : "130200",
  "fullname" : "唐山市"
}, {
  "level" : 2,
  "name" : "秦皇岛",
  "pid" : "130000",
  "id" : "130300",
  "fullname" : "秦皇岛市"
}, {
  "level" : 2,
  "name" : "邯郸",
  "pid" : "130000",
  "id" : "130400",
  "fullname" : "邯郸市"
}, {
  "level" : 2,
  "name" : "邢台",
  "pid" : "130000",
  "id" : "130500",
  "fullname" : "邢台市"
}, {
  "level" : 2,
  "name" : "保定",
  "pid" : "130000",
  "id" : "130600",
  "fullname" : "保定市"
}, {
  "level" : 2,
  "name" : "张家口",
  "pid" : "130000",
  "id" : "130700",
  "fullname" : "张家口市"
}, {
  "level" : 2,
  "name" : "承德",
  "pid" : "130000",
  "id" : "130800",
  "fullname" : "承德市"
}, {
  "level" : 2,
  "name" : "沧州",
  "pid" : "130000",
  "id" : "130900",
  "fullname" : "沧州市"
}, {
  "level" : 2,
  "name" : "廊坊",
  "pid" : "130000",
  "id" : "131000",
  "fullname" : "廊坊市"
}, {
  "level" : 2,
  "name" : "衡水",
  "pid" : "130000",
  "id" : "131100",
  "fullname" : "衡水市"
}, {
  "level" : 2,
  "name" : "太原",
  "pid" : "140000",
  "id" : "140100",
  "fullname" : "太原市"
}, {
  "level" : 2,
  "name" : "大同",
  "pid" : "140000",
  "id" : "140200",
  "fullname" : "大同市"
}, {
  "level" : 2,
  "name" : "阳泉",
  "pid" : "140000",
  "id" : "140300",
  "fullname" : "阳泉市"
}, {
  "level" : 2,
  "name" : "长治",
  "pid" : "140000",
  "id" : "140400",
  "fullname" : "长治市"
}, {
  "level" : 2,
  "name" : "晋城",
  "pid" : "140000",
  "id" : "140500",
  "fullname" : "晋城市"
}, {
  "level" : 2,
  "name" : "朔州",
  "pid" : "140000",
  "id" : "140600",
  "fullname" : "朔州市"
}, {
  "level" : 2,
  "name" : "晋中",
  "pid" : "140000",
  "id" : "140700",
  "fullname" : "晋中市"
}, {
  "level" : 2,
  "name" : "运城",
  "pid" : "140000",
  "id" : "140800",
  "fullname" : "运城市"
}, {
  "level" : 2,
  "name" : "忻州",
  "pid" : "140000",
  "id" : "140900",
  "fullname" : "忻州市"
}, {
  "level" : 2,
  "name" : "临汾",
  "pid" : "140000",
  "id" : "141000",
  "fullname" : "临汾市"
}, {
  "level" : 2,
  "name" : "吕梁",
  "pid" : "140000",
  "id" : "141100",
  "fullname" : "吕梁市"
}, {
  "level" : 2,
  "name" : "呼和浩特",
  "pid" : "150000",
  "id" : "150100",
  "fullname" : "呼和浩特市"
}, {
  "level" : 2,
  "name" : "包头",
  "pid" : "150000",
  "id" : "150200",
  "fullname" : "包头市"
}, {
  "level" : 2,
  "name" : "乌海",
  "pid" : "150000",
  "id" : "150300",
  "fullname" : "乌海市"
}, {
  "level" : 2,
  "name" : "赤峰",
  "pid" : "150000",
  "id" : "150400",
  "fullname" : "赤峰市"
}, {
  "level" : 2,
  "name" : "通辽",
  "pid" : "150000",
  "id" : "150500",
  "fullname" : "通辽市"
}, {
  "level" : 2,
  "name" : "鄂尔多斯",
  "pid" : "150000",
  "id" : "150600",
  "fullname" : "鄂尔多斯市"
}, {
  "level" : 2,
  "name" : "呼伦贝尔",
  "pid" : "150000",
  "id" : "150700",
  "fullname" : "呼伦贝尔市"
}, {
  "level" : 2,
  "name" : "巴彦淖尔",
  "pid" : "150000",
  "id" : "150800",
  "fullname" : "巴彦淖尔市"
}, {
  "level" : 2,
  "name" : "乌兰察布",
  "pid" : "150000",
  "id" : "150900",
  "fullname" : "乌兰察布市"
}, {
  "level" : 2,
  "name" : "兴安",
  "pid" : "150000",
  "id" : "152200",
  "fullname" : "兴安盟"
}, {
  "level" : 2,
  "name" : "锡林郭勒",
  "pid" : "150000",
  "id" : "152500",
  "fullname" : "锡林郭勒盟"
}, {
  "level" : 2,
  "name" : "阿拉善",
  "pid" : "150000",
  "id" : "152900",
  "fullname" : "阿拉善盟"
}, {
  "level" : 2,
  "name" : "沈阳",
  "pid" : "210000",
  "id" : "210100",
  "fullname" : "沈阳市"
}, {
  "level" : 2,
  "name" : "大连",
  "pid" : "210000",
  "id" : "210200",
  "fullname" : "大连市"
}, {
  "level" : 2,
  "name" : "鞍山",
  "pid" : "210000",
  "id" : "210300",
  "fullname" : "鞍山市"
}, {
  "level" : 2,
  "name" : "抚顺",
  "pid" : "210000",
  "id" : "210400",
  "fullname" : "抚顺市"
}, {
  "level" : 2,
  "name" : "本溪",
  "pid" : "210000",
  "id" : "210500",
  "fullname" : "本溪市"
}, {
  "level" : 2,
  "name" : "丹东",
  "pid" : "210000",
  "id" : "210600",
  "fullname" : "丹东市"
}, {
  "level" : 2,
  "name" : "锦州",
  "pid" : "210000",
  "id" : "210700",
  "fullname" : "锦州市"
}, {
  "level" : 2,
  "name" : "营口",
  "pid" : "210000",
  "id" : "210800",
  "fullname" : "营口市"
}, {
  "level" : 2,
  "name" : "阜新",
  "pid" : "210000",
  "id" : "210900",
  "fullname" : "阜新市"
}, {
  "level" : 2,
  "name" : "辽阳",
  "pid" : "210000",
  "id" : "211000",
  "fullname" : "辽阳市"
}, {
  "level" : 2,
  "name" : "盘锦",
  "pid" : "210000",
  "id" : "211100",
  "fullname" : "盘锦市"
}, {
  "level" : 2,
  "name" : "铁岭",
  "pid" : "210000",
  "id" : "211200",
  "fullname" : "铁岭市"
}, {
  "level" : 2,
  "name" : "朝阳",
  "pid" : "210000",
  "id" : "211300",
  "fullname" : "朝阳市"
}, {
  "level" : 2,
  "name" : "葫芦岛",
  "pid" : "210000",
  "id" : "211400",
  "fullname" : "葫芦岛市"
}, {
  "level" : 2,
  "name" : "长春",
  "pid" : "220000",
  "id" : "220100",
  "fullname" : "长春市"
}, {
  "level" : 2,
  "name" : "吉林",
  "pid" : "220000",
  "id" : "220200",
  "fullname" : "吉林市"
}, {
  "level" : 2,
  "name" : "四平",
  "pid" : "220000",
  "id" : "220300",
  "fullname" : "四平市"
}, {
  "level" : 2,
  "name" : "辽源",
  "pid" : "220000",
  "id" : "220400",
  "fullname" : "辽源市"
}, {
  "level" : 2,
  "name" : "通化",
  "pid" : "220000",
  "id" : "220500",
  "fullname" : "通化市"
}, {
  "level" : 2,
  "name" : "白山",
  "pid" : "220000",
  "id" : "220600",
  "fullname" : "白山市"
}, {
  "level" : 2,
  "name" : "松原",
  "pid" : "220000",
  "id" : "220700",
  "fullname" : "松原市"
}, {
  "level" : 2,
  "name" : "白城",
  "pid" : "220000",
  "id" : "220800",
  "fullname" : "白城市"
}, {
  "level" : 2,
  "name" : "延边",
  "pid" : "220000",
  "id" : "222400",
  "fullname" : "延边朝鲜族自治州"
}, {
  "level" : 2,
  "name" : "哈尔滨",
  "pid" : "230000",
  "id" : "230100",
  "fullname" : "哈尔滨市"
}, {
  "level" : 2,
  "name" : "齐齐哈尔",
  "pid" : "230000",
  "id" : "230200",
  "fullname" : "齐齐哈尔市"
}, {
  "level" : 2,
  "name" : "鸡西",
  "pid" : "230000",
  "id" : "230300",
  "fullname" : "鸡西市"
}, {
  "level" : 2,
  "name" : "鹤岗",
  "pid" : "230000",
  "id" : "230400",
  "fullname" : "鹤岗市"
}, {
  "level" : 2,
  "name" : "双鸭山",
  "pid" : "230000",
  "id" : "230500",
  "fullname" : "双鸭山市"
}, {
  "level" : 2,
  "name" : "大庆",
  "pid" : "230000",
  "id" : "230600",
  "fullname" : "大庆市"
}, {
  "level" : 2,
  "name" : "伊春",
  "pid" : "230000",
  "id" : "230700",
  "fullname" : "伊春市"
}, {
  "level" : 2,
  "name" : "佳木斯",
  "pid" : "230000",
  "id" : "230800",
  "fullname" : "佳木斯市"
}, {
  "level" : 2,
  "name" : "七台河",
  "pid" : "230000",
  "id" : "230900",
  "fullname" : "七台河市"
}, {
  "level" : 2,
  "name" : "牡丹江",
  "pid" : "230000",
  "id" : "231000",
  "fullname" : "牡丹江市"
}, {
  "level" : 2,
  "name" : "黑河",
  "pid" : "230000",
  "id" : "231100",
  "fullname" : "黑河市"
}, {
  "level" : 2,
  "name" : "绥化",
  "pid" : "230000",
  "id" : "231200",
  "fullname" : "绥化市"
}, {
  "level" : 2,
  "name" : "大兴安岭",
  "pid" : "230000",
  "id" : "232700",
  "fullname" : "大兴安岭地区"
}, {
  "level" : 2,
  "name" : "黄浦",
  "pid" : "310000",
  "id" : "310101",
  "fullname" : "黄浦区"
}, {
  "level" : 2,
  "name" : "徐汇",
  "pid" : "310000",
  "id" : "310104",
  "fullname" : "徐汇区"
}, {
  "level" : 2,
  "name" : "长宁",
  "pid" : "310000",
  "id" : "310105",
  "fullname" : "长宁区"
}, {
  "level" : 2,
  "name" : "静安",
  "pid" : "310000",
  "id" : "310106",
  "fullname" : "静安区"
}, {
  "level" : 2,
  "name" : "普陀",
  "pid" : "310000",
  "id" : "310107",
  "fullname" : "普陀区"
}, {
  "level" : 2,
  "name" : "虹口",
  "pid" : "310000",
  "id" : "310109",
  "fullname" : "虹口区"
}, {
  "level" : 2,
  "name" : "杨浦",
  "pid" : "310000",
  "id" : "310110",
  "fullname" : "杨浦区"
}, {
  "level" : 2,
  "name" : "闵行",
  "pid" : "310000",
  "id" : "310112",
  "fullname" : "闵行区"
}, {
  "level" : 2,
  "name" : "宝山",
  "pid" : "310000",
  "id" : "310113",
  "fullname" : "宝山区"
}, {
  "level" : 2,
  "name" : "嘉定",
  "pid" : "310000",
  "id" : "310114",
  "fullname" : "嘉定区"
}, {
  "level" : 2,
  "name" : "浦东",
  "pid" : "310000",
  "id" : "310115",
  "fullname" : "浦东新区"
}, {
  "level" : 2,
  "name" : "金山",
  "pid" : "310000",
  "id" : "310116",
  "fullname" : "金山区"
}, {
  "level" : 2,
  "name" : "松江",
  "pid" : "310000",
  "id" : "310117",
  "fullname" : "松江区"
}, {
  "level" : 2,
  "name" : "青浦",
  "pid" : "310000",
  "id" : "310118",
  "fullname" : "青浦区"
}, {
  "level" : 2,
  "name" : "奉贤",
  "pid" : "310000",
  "id" : "310120",
  "fullname" : "奉贤区"
}, {
  "level" : 2,
  "name" : "崇明",
  "pid" : "310000",
  "id" : "310151",
  "fullname" : "崇明区"
}, {
  "level" : 2,
  "name" : "南京",
  "pid" : "320000",
  "id" : "320100",
  "fullname" : "南京市"
}, {
  "level" : 2,
  "name" : "无锡",
  "pid" : "320000",
  "id" : "320200",
  "fullname" : "无锡市"
}, {
  "level" : 2,
  "name" : "徐州",
  "pid" : "320000",
  "id" : "320300",
  "fullname" : "徐州市"
}, {
  "level" : 2,
  "name" : "常州",
  "pid" : "320000",
  "id" : "320400",
  "fullname" : "常州市"
}, {
  "level" : 2,
  "name" : "苏州",
  "pid" : "320000",
  "id" : "320500",
  "fullname" : "苏州市"
}, {
  "level" : 2,
  "name" : "南通",
  "pid" : "320000",
  "id" : "320600",
  "fullname" : "南通市"
}, {
  "level" : 2,
  "name" : "连云港",
  "pid" : "320000",
  "id" : "320700",
  "fullname" : "连云港市"
}, {
  "level" : 2,
  "name" : "淮安",
  "pid" : "320000",
  "id" : "320800",
  "fullname" : "淮安市"
}, {
  "level" : 2,
  "name" : "盐城",
  "pid" : "320000",
  "id" : "320900",
  "fullname" : "盐城市"
}, {
  "level" : 2,
  "name" : "扬州",
  "pid" : "320000",
  "id" : "321000",
  "fullname" : "扬州市"
}, {
  "level" : 2,
  "name" : "镇江",
  "pid" : "320000",
  "id" : "321100",
  "fullname" : "镇江市"
}, {
  "level" : 2,
  "name" : "泰州",
  "pid" : "320000",
  "id" : "321200",
  "fullname" : "泰州市"
}, {
  "level" : 2,
  "name" : "宿迁",
  "pid" : "320000",
  "id" : "321300",
  "fullname" : "宿迁市"
}, {
  "level" : 2,
  "name" : "杭州",
  "pid" : "330000",
  "id" : "330100",
  "fullname" : "杭州市"
}, {
  "level" : 2,
  "name" : "宁波",
  "pid" : "330000",
  "id" : "330200",
  "fullname" : "宁波市"
}, {
  "level" : 2,
  "name" : "温州",
  "pid" : "330000",
  "id" : "330300",
  "fullname" : "温州市"
}, {
  "level" : 2,
  "name" : "嘉兴",
  "pid" : "330000",
  "id" : "330400",
  "fullname" : "嘉兴市"
}, {
  "level" : 2,
  "name" : "湖州",
  "pid" : "330000",
  "id" : "330500",
  "fullname" : "湖州市"
}, {
  "level" : 2,
  "name" : "绍兴",
  "pid" : "330000",
  "id" : "330600",
  "fullname" : "绍兴市"
}, {
  "level" : 2,
  "name" : "金华",
  "pid" : "330000",
  "id" : "330700",
  "fullname" : "金华市"
}, {
  "level" : 2,
  "name" : "衢州",
  "pid" : "330000",
  "id" : "330800",
  "fullname" : "衢州市"
}, {
  "level" : 2,
  "name" : "舟山",
  "pid" : "330000",
  "id" : "330900",
  "fullname" : "舟山市"
}, {
  "level" : 2,
  "name" : "台州",
  "pid" : "330000",
  "id" : "331000",
  "fullname" : "台州市"
}, {
  "level" : 2,
  "name" : "丽水",
  "pid" : "330000",
  "id" : "331100",
  "fullname" : "丽水市"
}, {
  "level" : 2,
  "name" : "合肥",
  "pid" : "340000",
  "id" : "340100",
  "fullname" : "合肥市"
}, {
  "level" : 2,
  "name" : "芜湖",
  "pid" : "340000",
  "id" : "340200",
  "fullname" : "芜湖市"
}, {
  "level" : 2,
  "name" : "蚌埠",
  "pid" : "340000",
  "id" : "340300",
  "fullname" : "蚌埠市"
}, {
  "level" : 2,
  "name" : "淮南",
  "pid" : "340000",
  "id" : "340400",
  "fullname" : "淮南市"
}, {
  "level" : 2,
  "name" : "马鞍山",
  "pid" : "340000",
  "id" : "340500",
  "fullname" : "马鞍山市"
}, {
  "level" : 2,
  "name" : "淮北",
  "pid" : "340000",
  "id" : "340600",
  "fullname" : "淮北市"
}, {
  "level" : 2,
  "name" : "铜陵",
  "pid" : "340000",
  "id" : "340700",
  "fullname" : "铜陵市"
}, {
  "level" : 2,
  "name" : "安庆",
  "pid" : "340000",
  "id" : "340800",
  "fullname" : "安庆市"
}, {
  "level" : 2,
  "name" : "黄山",
  "pid" : "340000",
  "id" : "341000",
  "fullname" : "黄山市"
}, {
  "level" : 2,
  "name" : "滁州",
  "pid" : "340000",
  "id" : "341100",
  "fullname" : "滁州市"
}, {
  "level" : 2,
  "name" : "阜阳",
  "pid" : "340000",
  "id" : "341200",
  "fullname" : "阜阳市"
}, {
  "level" : 2,
  "name" : "宿州",
  "pid" : "340000",
  "id" : "341300",
  "fullname" : "宿州市"
}, {
  "level" : 2,
  "name" : "六安",
  "pid" : "340000",
  "id" : "341500",
  "fullname" : "六安市"
}, {
  "level" : 2,
  "name" : "亳州",
  "pid" : "340000",
  "id" : "341600",
  "fullname" : "亳州市"
}, {
  "level" : 2,
  "name" : "池州",
  "pid" : "340000",
  "id" : "341700",
  "fullname" : "池州市"
}, {
  "level" : 2,
  "name" : "宣城",
  "pid" : "340000",
  "id" : "341800",
  "fullname" : "宣城市"
}, {
  "level" : 2,
  "name" : "福州",
  "pid" : "350000",
  "id" : "350100",
  "fullname" : "福州市"
}, {
  "level" : 2,
  "name" : "厦门",
  "pid" : "350000",
  "id" : "350200",
  "fullname" : "厦门市"
}, {
  "level" : 2,
  "name" : "莆田",
  "pid" : "350000",
  "id" : "350300",
  "fullname" : "莆田市"
}, {
  "level" : 2,
  "name" : "三明",
  "pid" : "350000",
  "id" : "350400",
  "fullname" : "三明市"
}, {
  "level" : 2,
  "name" : "泉州",
  "pid" : "350000",
  "id" : "350500",
  "fullname" : "泉州市"
}, {
  "level" : 2,
  "name" : "漳州",
  "pid" : "350000",
  "id" : "350600",
  "fullname" : "漳州市"
}, {
  "level" : 2,
  "name" : "南平",
  "pid" : "350000",
  "id" : "350700",
  "fullname" : "南平市"
}, {
  "level" : 2,
  "name" : "龙岩",
  "pid" : "350000",
  "id" : "350800",
  "fullname" : "龙岩市"
}, {
  "level" : 2,
  "name" : "宁德",
  "pid" : "350000",
  "id" : "350900",
  "fullname" : "宁德市"
}, {
  "level" : 2,
  "name" : "南昌",
  "pid" : "360000",
  "id" : "360100",
  "fullname" : "南昌市"
}, {
  "level" : 2,
  "name" : "景德镇",
  "pid" : "360000",
  "id" : "360200",
  "fullname" : "景德镇市"
}, {
  "level" : 2,
  "name" : "萍乡",
  "pid" : "360000",
  "id" : "360300",
  "fullname" : "萍乡市"
}, {
  "level" : 2,
  "name" : "九江",
  "pid" : "360000",
  "id" : "360400",
  "fullname" : "九江市"
}, {
  "level" : 2,
  "name" : "新余",
  "pid" : "360000",
  "id" : "360500",
  "fullname" : "新余市"
}, {
  "level" : 2,
  "name" : "鹰潭",
  "pid" : "360000",
  "id" : "360600",
  "fullname" : "鹰潭市"
}, {
  "level" : 2,
  "name" : "赣州",
  "pid" : "360000",
  "id" : "360700",
  "fullname" : "赣州市"
}, {
  "level" : 2,
  "name" : "吉安",
  "pid" : "360000",
  "id" : "360800",
  "fullname" : "吉安市"
}, {
  "level" : 2,
  "name" : "宜春",
  "pid" : "360000",
  "id" : "360900",
  "fullname" : "宜春市"
}, {
  "level" : 2,
  "name" : "抚州",
  "pid" : "360000",
  "id" : "361000",
  "fullname" : "抚州市"
}, {
  "level" : 2,
  "name" : "上饶",
  "pid" : "360000",
  "id" : "361100",
  "fullname" : "上饶市"
}, {
  "level" : 2,
  "name" : "济南",
  "pid" : "370000",
  "id" : "370100",
  "fullname" : "济南市"
}, {
  "level" : 2,
  "name" : "青岛",
  "pid" : "370000",
  "id" : "370200",
  "fullname" : "青岛市"
}, {
  "level" : 2,
  "name" : "淄博",
  "pid" : "370000",
  "id" : "370300",
  "fullname" : "淄博市"
}, {
  "level" : 2,
  "name" : "枣庄",
  "pid" : "370000",
  "id" : "370400",
  "fullname" : "枣庄市"
}, {
  "level" : 2,
  "name" : "东营",
  "pid" : "370000",
  "id" : "370500",
  "fullname" : "东营市"
}, {
  "level" : 2,
  "name" : "烟台",
  "pid" : "370000",
  "id" : "370600",
  "fullname" : "烟台市"
}, {
  "level" : 2,
  "name" : "潍坊",
  "pid" : "370000",
  "id" : "370700",
  "fullname" : "潍坊市"
}, {
  "level" : 2,
  "name" : "济宁",
  "pid" : "370000",
  "id" : "370800",
  "fullname" : "济宁市"
}, {
  "level" : 2,
  "name" : "泰安",
  "pid" : "370000",
  "id" : "370900",
  "fullname" : "泰安市"
}, {
  "level" : 2,
  "name" : "威海",
  "pid" : "370000",
  "id" : "371000",
  "fullname" : "威海市"
}, {
  "level" : 2,
  "name" : "日照",
  "pid" : "370000",
  "id" : "371100",
  "fullname" : "日照市"
}, {
  "level" : 2,
  "name" : "临沂",
  "pid" : "370000",
  "id" : "371300",
  "fullname" : "临沂市"
}, {
  "level" : 2,
  "name" : "德州",
  "pid" : "370000",
  "id" : "371400",
  "fullname" : "德州市"
}, {
  "level" : 2,
  "name" : "聊城",
  "pid" : "370000",
  "id" : "371500",
  "fullname" : "聊城市"
}, {
  "level" : 2,
  "name" : "滨州",
  "pid" : "370000",
  "id" : "371600",
  "fullname" : "滨州市"
}, {
  "level" : 2,
  "name" : "菏泽",
  "pid" : "370000",
  "id" : "371700",
  "fullname" : "菏泽市"
}, {
  "level" : 2,
  "name" : "郑州",
  "pid" : "410000",
  "id" : "410100",
  "fullname" : "郑州市"
}, {
  "level" : 2,
  "name" : "开封",
  "pid" : "410000",
  "id" : "410200",
  "fullname" : "开封市"
}, {
  "level" : 2,
  "name" : "洛阳",
  "pid" : "410000",
  "id" : "410300",
  "fullname" : "洛阳市"
}, {
  "level" : 2,
  "name" : "平顶山",
  "pid" : "410000",
  "id" : "410400",
  "fullname" : "平顶山市"
}, {
  "level" : 2,
  "name" : "安阳",
  "pid" : "410000",
  "id" : "410500",
  "fullname" : "安阳市"
}, {
  "level" : 2,
  "name" : "鹤壁",
  "pid" : "410000",
  "id" : "410600",
  "fullname" : "鹤壁市"
}, {
  "level" : 2,
  "name" : "新乡",
  "pid" : "410000",
  "id" : "410700",
  "fullname" : "新乡市"
}, {
  "level" : 2,
  "name" : "焦作",
  "pid" : "410000",
  "id" : "410800",
  "fullname" : "焦作市"
}, {
  "level" : 2,
  "name" : "濮阳",
  "pid" : "410000",
  "id" : "410900",
  "fullname" : "濮阳市"
}, {
  "level" : 2,
  "name" : "许昌",
  "pid" : "410000",
  "id" : "411000",
  "fullname" : "许昌市"
}, {
  "level" : 2,
  "name" : "漯河",
  "pid" : "410000",
  "id" : "411100",
  "fullname" : "漯河市"
}, {
  "level" : 2,
  "name" : "三门峡",
  "pid" : "410000",
  "id" : "411200",
  "fullname" : "三门峡市"
}, {
  "level" : 2,
  "name" : "南阳",
  "pid" : "410000",
  "id" : "411300",
  "fullname" : "南阳市"
}, {
  "level" : 2,
  "name" : "商丘",
  "pid" : "410000",
  "id" : "411400",
  "fullname" : "商丘市"
}, {
  "level" : 2,
  "name" : "信阳",
  "pid" : "410000",
  "id" : "411500",
  "fullname" : "信阳市"
}, {
  "level" : 2,
  "name" : "周口",
  "pid" : "410000",
  "id" : "411600",
  "fullname" : "周口市"
}, {
  "level" : 2,
  "name" : "驻马店",
  "pid" : "410000",
  "id" : "411700",
  "fullname" : "驻马店市"
}, {
  "level" : 2,
  "name" : "济源",
  "pid" : "410000",
  "id" : "419001",
  "fullname" : "济源市"
}, {
  "level" : 2,
  "name" : "武汉",
  "pid" : "420000",
  "id" : "420100",
  "fullname" : "武汉市"
}, {
  "level" : 2,
  "name" : "黄石",
  "pid" : "420000",
  "id" : "420200",
  "fullname" : "黄石市"
}, {
  "level" : 2,
  "name" : "十堰",
  "pid" : "420000",
  "id" : "420300",
  "fullname" : "十堰市"
}, {
  "level" : 2,
  "name" : "宜昌",
  "pid" : "420000",
  "id" : "420500",
  "fullname" : "宜昌市"
}, {
  "level" : 2,
  "name" : "襄阳",
  "pid" : "420000",
  "id" : "420600",
  "fullname" : "襄阳市"
}, {
  "level" : 2,
  "name" : "鄂州",
  "pid" : "420000",
  "id" : "420700",
  "fullname" : "鄂州市"
}, {
  "level" : 2,
  "name" : "荆门",
  "pid" : "420000",
  "id" : "420800",
  "fullname" : "荆门市"
}, {
  "level" : 2,
  "name" : "孝感",
  "pid" : "420000",
  "id" : "420900",
  "fullname" : "孝感市"
}, {
  "level" : 2,
  "name" : "荆州",
  "pid" : "420000",
  "id" : "421000",
  "fullname" : "荆州市"
}, {
  "level" : 2,
  "name" : "黄冈",
  "pid" : "420000",
  "id" : "421100",
  "fullname" : "黄冈市"
}, {
  "level" : 2,
  "name" : "咸宁",
  "pid" : "420000",
  "id" : "421200",
  "fullname" : "咸宁市"
}, {
  "level" : 2,
  "name" : "随州",
  "pid" : "420000",
  "id" : "421300",
  "fullname" : "随州市"
}, {
  "level" : 2,
  "name" : "恩施",
  "pid" : "420000",
  "id" : "422800",
  "fullname" : "恩施土家族苗族自治州"
}, {
  "level" : 2,
  "name" : "仙桃",
  "pid" : "420000",
  "id" : "429004",
  "fullname" : "仙桃市"
}, {
  "level" : 2,
  "name" : "潜江",
  "pid" : "420000",
  "id" : "429005",
  "fullname" : "潜江市"
}, {
  "level" : 2,
  "name" : "天门",
  "pid" : "420000",
  "id" : "429006",
  "fullname" : "天门市"
}, {
  "level" : 2,
  "name" : "神农架",
  "pid" : "420000",
  "id" : "429021",
  "fullname" : "神农架林区"
}, {
  "level" : 2,
  "name" : "长沙",
  "pid" : "430000",
  "id" : "430100",
  "fullname" : "长沙市"
}, {
  "level" : 2,
  "name" : "株洲",
  "pid" : "430000",
  "id" : "430200",
  "fullname" : "株洲市"
}, {
  "level" : 2,
  "name" : "湘潭",
  "pid" : "430000",
  "id" : "430300",
  "fullname" : "湘潭市"
}, {
  "level" : 2,
  "name" : "衡阳",
  "pid" : "430000",
  "id" : "430400",
  "fullname" : "衡阳市"
}, {
  "level" : 2,
  "name" : "邵阳",
  "pid" : "430000",
  "id" : "430500",
  "fullname" : "邵阳市"
}, {
  "level" : 2,
  "name" : "岳阳",
  "pid" : "430000",
  "id" : "430600",
  "fullname" : "岳阳市"
}, {
  "level" : 2,
  "name" : "常德",
  "pid" : "430000",
  "id" : "430700",
  "fullname" : "常德市"
}, {
  "level" : 2,
  "name" : "张家界",
  "pid" : "430000",
  "id" : "430800",
  "fullname" : "张家界市"
}, {
  "level" : 2,
  "name" : "益阳",
  "pid" : "430000",
  "id" : "430900",
  "fullname" : "益阳市"
}, {
  "level" : 2,
  "name" : "郴州",
  "pid" : "430000",
  "id" : "431000",
  "fullname" : "郴州市"
}, {
  "level" : 2,
  "name" : "永州",
  "pid" : "430000",
  "id" : "431100",
  "fullname" : "永州市"
}, {
  "level" : 2,
  "name" : "怀化",
  "pid" : "430000",
  "id" : "431200",
  "fullname" : "怀化市"
}, {
  "level" : 2,
  "name" : "娄底",
  "pid" : "430000",
  "id" : "431300",
  "fullname" : "娄底市"
}, {
  "level" : 2,
  "name" : "湘西",
  "pid" : "430000",
  "id" : "433100",
  "fullname" : "湘西土家族苗族自治州"
}, {
  "level" : 2,
  "name" : "广州",
  "pid" : "440000",
  "id" : "440100",
  "fullname" : "广州市"
}, {
  "level" : 2,
  "name" : "韶关",
  "pid" : "440000",
  "id" : "440200",
  "fullname" : "韶关市"
}, {
  "level" : 2,
  "name" : "深圳",
  "pid" : "440000",
  "id" : "440300",
  "fullname" : "深圳市"
}, {
  "level" : 2,
  "name" : "珠海",
  "pid" : "440000",
  "id" : "440400",
  "fullname" : "珠海市"
}, {
  "level" : 2,
  "name" : "汕头",
  "pid" : "440000",
  "id" : "440500",
  "fullname" : "汕头市"
}, {
  "level" : 2,
  "name" : "佛山",
  "pid" : "440000",
  "id" : "440600",
  "fullname" : "佛山市"
}, {
  "level" : 2,
  "name" : "江门",
  "pid" : "440000",
  "id" : "440700",
  "fullname" : "江门市"
}, {
  "level" : 2,
  "name" : "湛江",
  "pid" : "440000",
  "id" : "440800",
  "fullname" : "湛江市"
}, {
  "level" : 2,
  "name" : "茂名",
  "pid" : "440000",
  "id" : "440900",
  "fullname" : "茂名市"
}, {
  "level" : 2,
  "name" : "肇庆",
  "pid" : "440000",
  "id" : "441200",
  "fullname" : "肇庆市"
}, {
  "level" : 2,
  "name" : "惠州",
  "pid" : "440000",
  "id" : "441300",
  "fullname" : "惠州市"
}, {
  "level" : 2,
  "name" : "梅州",
  "pid" : "440000",
  "id" : "441400",
  "fullname" : "梅州市"
}, {
  "level" : 2,
  "name" : "汕尾",
  "pid" : "440000",
  "id" : "441500",
  "fullname" : "汕尾市"
}, {
  "level" : 2,
  "name" : "河源",
  "pid" : "440000",
  "id" : "441600",
  "fullname" : "河源市"
}, {
  "level" : 2,
  "name" : "阳江",
  "pid" : "440000",
  "id" : "441700",
  "fullname" : "阳江市"
}, {
  "level" : 2,
  "name" : "清远",
  "pid" : "440000",
  "id" : "441800",
  "fullname" : "清远市"
}, {
  "level" : 2,
  "name" : "东莞",
  "pid" : "440000",
  "id" : "441900",
  "fullname" : "东莞市"
}, {
  "level" : 2,
  "name" : "中山",
  "pid" : "440000",
  "id" : "442000",
  "fullname" : "中山市"
}, {
  "level" : 2,
  "name" : "潮州",
  "pid" : "440000",
  "id" : "445100",
  "fullname" : "潮州市"
}, {
  "level" : 2,
  "name" : "揭阳",
  "pid" : "440000",
  "id" : "445200",
  "fullname" : "揭阳市"
}, {
  "level" : 2,
  "name" : "云浮",
  "pid" : "440000",
  "id" : "445300",
  "fullname" : "云浮市"
}, {
  "level" : 2,
  "name" : "南宁",
  "pid" : "450000",
  "id" : "450100",
  "fullname" : "南宁市"
}, {
  "level" : 2,
  "name" : "柳州",
  "pid" : "450000",
  "id" : "450200",
  "fullname" : "柳州市"
}, {
  "level" : 2,
  "name" : "桂林",
  "pid" : "450000",
  "id" : "450300",
  "fullname" : "桂林市"
}, {
  "level" : 2,
  "name" : "梧州",
  "pid" : "450000",
  "id" : "450400",
  "fullname" : "梧州市"
}, {
  "level" : 2,
  "name" : "北海",
  "pid" : "450000",
  "id" : "450500",
  "fullname" : "北海市"
}, {
  "level" : 2,
  "name" : "防城港",
  "pid" : "450000",
  "id" : "450600",
  "fullname" : "防城港市"
}, {
  "level" : 2,
  "name" : "钦州",
  "pid" : "450000",
  "id" : "450700",
  "fullname" : "钦州市"
}, {
  "level" : 2,
  "name" : "贵港",
  "pid" : "450000",
  "id" : "450800",
  "fullname" : "贵港市"
}, {
  "level" : 2,
  "name" : "玉林",
  "pid" : "450000",
  "id" : "450900",
  "fullname" : "玉林市"
}, {
  "level" : 2,
  "name" : "百色",
  "pid" : "450000",
  "id" : "451000",
  "fullname" : "百色市"
}, {
  "level" : 2,
  "name" : "贺州",
  "pid" : "450000",
  "id" : "451100",
  "fullname" : "贺州市"
}, {
  "level" : 2,
  "name" : "河池",
  "pid" : "450000",
  "id" : "451200",
  "fullname" : "河池市"
}, {
  "level" : 2,
  "name" : "来宾",
  "pid" : "450000",
  "id" : "451300",
  "fullname" : "来宾市"
}, {
  "level" : 2,
  "name" : "崇左",
  "pid" : "450000",
  "id" : "451400",
  "fullname" : "崇左市"
}, {
  "level" : 2,
  "name" : "海口",
  "pid" : "460000",
  "id" : "460100",
  "fullname" : "海口市"
}, {
  "level" : 2,
  "name" : "三亚",
  "pid" : "460000",
  "id" : "460200",
  "fullname" : "三亚市"
}, {
  "level" : 2,
  "name" : "三沙",
  "pid" : "460000",
  "id" : "460300",
  "fullname" : "三沙市"
}, {
  "level" : 2,
  "name" : "儋州",
  "pid" : "460000",
  "id" : "460400",
  "fullname" : "儋州市"
}, {
  "level" : 2,
  "name" : "五指山",
  "pid" : "460000",
  "id" : "469001",
  "fullname" : "五指山市"
}, {
  "level" : 2,
  "name" : "琼海",
  "pid" : "460000",
  "id" : "469002",
  "fullname" : "琼海市"
}, {
  "level" : 2,
  "name" : "文昌",
  "pid" : "460000",
  "id" : "469005",
  "fullname" : "文昌市"
}, {
  "level" : 2,
  "name" : "万宁",
  "pid" : "460000",
  "id" : "469006",
  "fullname" : "万宁市"
}, {
  "level" : 2,
  "name" : "东方",
  "pid" : "460000",
  "id" : "469007",
  "fullname" : "东方市"
}, {
  "level" : 2,
  "name" : "定安",
  "pid" : "460000",
  "id" : "469021",
  "fullname" : "定安县"
}, {
  "level" : 2,
  "name" : "屯昌",
  "pid" : "460000",
  "id" : "469022",
  "fullname" : "屯昌县"
}, {
  "level" : 2,
  "name" : "澄迈",
  "pid" : "460000",
  "id" : "469023",
  "fullname" : "澄迈县"
}, {
  "level" : 2,
  "name" : "临高",
  "pid" : "460000",
  "id" : "469024",
  "fullname" : "临高县"
}, {
  "level" : 2,
  "name" : "白沙",
  "pid" : "460000",
  "id" : "469025",
  "fullname" : "白沙黎族自治县"
}, {
  "level" : 2,
  "name" : "昌江",
  "pid" : "460000",
  "id" : "469026",
  "fullname" : "昌江黎族自治县"
}, {
  "level" : 2,
  "name" : "乐东",
  "pid" : "460000",
  "id" : "469027",
  "fullname" : "乐东黎族自治县"
}, {
  "level" : 2,
  "name" : "陵水",
  "pid" : "460000",
  "id" : "469028",
  "fullname" : "陵水黎族自治县"
}, {
  "level" : 2,
  "name" : "保亭",
  "pid" : "460000",
  "id" : "469029",
  "fullname" : "保亭黎族苗族自治县"
}, {
  "level" : 2,
  "name" : "琼中",
  "pid" : "460000",
  "id" : "469030",
  "fullname" : "琼中黎族苗族自治县"
}, {
  "level" : 2,
  "name" : "万州",
  "pid" : "500000",
  "id" : "500101",
  "fullname" : "万州区"
}, {
  "level" : 2,
  "name" : "涪陵",
  "pid" : "500000",
  "id" : "500102",
  "fullname" : "涪陵区"
}, {
  "level" : 2,
  "name" : "渝中",
  "pid" : "500000",
  "id" : "500103",
  "fullname" : "渝中区"
}, {
  "level" : 2,
  "name" : "大渡口",
  "pid" : "500000",
  "id" : "500104",
  "fullname" : "大渡口区"
}, {
  "level" : 2,
  "name" : "江北",
  "pid" : "500000",
  "id" : "500105",
  "fullname" : "江北区"
}, {
  "level" : 2,
  "name" : "沙坪坝",
  "pid" : "500000",
  "id" : "500106",
  "fullname" : "沙坪坝区"
}, {
  "level" : 2,
  "name" : "九龙坡",
  "pid" : "500000",
  "id" : "500107",
  "fullname" : "九龙坡区"
}, {
  "level" : 2,
  "name" : "南岸",
  "pid" : "500000",
  "id" : "500108",
  "fullname" : "南岸区"
}, {
  "level" : 2,
  "name" : "北碚",
  "pid" : "500000",
  "id" : "500109",
  "fullname" : "北碚区"
}, {
  "level" : 2,
  "name" : "綦江",
  "pid" : "500000",
  "id" : "500110",
  "fullname" : "綦江区"
}, {
  "level" : 2,
  "name" : "大足",
  "pid" : "500000",
  "id" : "500111",
  "fullname" : "大足区"
}, {
  "level" : 2,
  "name" : "渝北",
  "pid" : "500000",
  "id" : "500112",
  "fullname" : "渝北区"
}, {
  "level" : 2,
  "name" : "巴南",
  "pid" : "500000",
  "id" : "500113",
  "fullname" : "巴南区"
}, {
  "level" : 2,
  "name" : "黔江",
  "pid" : "500000",
  "id" : "500114",
  "fullname" : "黔江区"
}, {
  "level" : 2,
  "name" : "长寿",
  "pid" : "500000",
  "id" : "500115",
  "fullname" : "长寿区"
}, {
  "level" : 2,
  "name" : "江津",
  "pid" : "500000",
  "id" : "500116",
  "fullname" : "江津区"
}, {
  "level" : 2,
  "name" : "合川",
  "pid" : "500000",
  "id" : "500117",
  "fullname" : "合川区"
}, {
  "level" : 2,
  "name" : "永川",
  "pid" : "500000",
  "id" : "500118",
  "fullname" : "永川区"
}, {
  "level" : 2,
  "name" : "南川",
  "pid" : "500000",
  "id" : "500119",
  "fullname" : "南川区"
}, {
  "level" : 2,
  "name" : "璧山",
  "pid" : "500000",
  "id" : "500120",
  "fullname" : "璧山区"
}, {
  "level" : 2,
  "name" : "铜梁",
  "pid" : "500000",
  "id" : "500151",
  "fullname" : "铜梁区"
}, {
  "level" : 2,
  "name" : "潼南",
  "pid" : "500000",
  "id" : "500152",
  "fullname" : "潼南区"
}, {
  "level" : 2,
  "name" : "荣昌",
  "pid" : "500000",
  "id" : "500153",
  "fullname" : "荣昌区"
}, {
  "level" : 2,
  "name" : "开州",
  "pid" : "500000",
  "id" : "500154",
  "fullname" : "开州区"
}, {
  "level" : 2,
  "name" : "梁平",
  "pid" : "500000",
  "id" : "500155",
  "fullname" : "梁平区"
}, {
  "level" : 2,
  "name" : "武隆",
  "pid" : "500000",
  "id" : "500156",
  "fullname" : "武隆区"
}, {
  "level" : 2,
  "name" : "城口",
  "pid" : "500000",
  "id" : "500229",
  "fullname" : "城口县"
}, {
  "level" : 2,
  "name" : "丰都",
  "pid" : "500000",
  "id" : "500230",
  "fullname" : "丰都县"
}, {
  "level" : 2,
  "name" : "垫江",
  "pid" : "500000",
  "id" : "500231",
  "fullname" : "垫江县"
}, {
  "level" : 2,
  "name" : "忠县",
  "pid" : "500000",
  "id" : "500233",
  "fullname" : "忠县"
}, {
  "level" : 2,
  "name" : "云阳",
  "pid" : "500000",
  "id" : "500235",
  "fullname" : "云阳县"
}, {
  "level" : 2,
  "name" : "奉节",
  "pid" : "500000",
  "id" : "500236",
  "fullname" : "奉节县"
}, {
  "level" : 2,
  "name" : "巫山",
  "pid" : "500000",
  "id" : "500237",
  "fullname" : "巫山县"
}, {
  "level" : 2,
  "name" : "巫溪",
  "pid" : "500000",
  "id" : "500238",
  "fullname" : "巫溪县"
}, {
  "level" : 2,
  "name" : "石柱",
  "pid" : "500000",
  "id" : "500240",
  "fullname" : "石柱土家族自治县"
}, {
  "level" : 2,
  "name" : "秀山",
  "pid" : "500000",
  "id" : "500241",
  "fullname" : "秀山土家族苗族自治县"
}, {
  "level" : 2,
  "name" : "酉阳",
  "pid" : "500000",
  "id" : "500242",
  "fullname" : "酉阳土家族苗族自治县"
}, {
  "level" : 2,
  "name" : "彭水",
  "pid" : "500000",
  "id" : "500243",
  "fullname" : "彭水苗族土家族自治县"
}, {
  "level" : 2,
  "name" : "成都",
  "pid" : "510000",
  "id" : "510100",
  "fullname" : "成都市"
}, {
  "level" : 2,
  "name" : "自贡",
  "pid" : "510000",
  "id" : "510300",
  "fullname" : "自贡市"
}, {
  "level" : 2,
  "name" : "攀枝花",
  "pid" : "510000",
  "id" : "510400",
  "fullname" : "攀枝花市"
}, {
  "level" : 2,
  "name" : "泸州",
  "pid" : "510000",
  "id" : "510500",
  "fullname" : "泸州市"
}, {
  "level" : 2,
  "name" : "德阳",
  "pid" : "510000",
  "id" : "510600",
  "fullname" : "德阳市"
}, {
  "level" : 2,
  "name" : "绵阳",
  "pid" : "510000",
  "id" : "510700",
  "fullname" : "绵阳市"
}, {
  "level" : 2,
  "name" : "广元",
  "pid" : "510000",
  "id" : "510800",
  "fullname" : "广元市"
}, {
  "level" : 2,
  "name" : "遂宁",
  "pid" : "510000",
  "id" : "510900",
  "fullname" : "遂宁市"
}, {
  "level" : 2,
  "name" : "内江",
  "pid" : "510000",
  "id" : "511000",
  "fullname" : "内江市"
}, {
  "level" : 2,
  "name" : "乐山",
  "pid" : "510000",
  "id" : "511100",
  "fullname" : "乐山市"
}, {
  "level" : 2,
  "name" : "南充",
  "pid" : "510000",
  "id" : "511300",
  "fullname" : "南充市"
}, {
  "level" : 2,
  "name" : "眉山",
  "pid" : "510000",
  "id" : "511400",
  "fullname" : "眉山市"
}, {
  "level" : 2,
  "name" : "宜宾",
  "pid" : "510000",
  "id" : "511500",
  "fullname" : "宜宾市"
}, {
  "level" : 2,
  "name" : "广安",
  "pid" : "510000",
  "id" : "511600",
  "fullname" : "广安市"
}, {
  "level" : 2,
  "name" : "达州",
  "pid" : "510000",
  "id" : "511700",
  "fullname" : "达州市"
}, {
  "level" : 2,
  "name" : "雅安",
  "pid" : "510000",
  "id" : "511800",
  "fullname" : "雅安市"
}, {
  "level" : 2,
  "name" : "巴中",
  "pid" : "510000",
  "id" : "511900",
  "fullname" : "巴中市"
}, {
  "level" : 2,
  "name" : "资阳",
  "pid" : "510000",
  "id" : "512000",
  "fullname" : "资阳市"
}, {
  "level" : 2,
  "name" : "阿坝",
  "pid" : "510000",
  "id" : "513200",
  "fullname" : "阿坝藏族羌族自治州"
}, {
  "level" : 2,
  "name" : "甘孜",
  "pid" : "510000",
  "id" : "513300",
  "fullname" : "甘孜藏族自治州"
}, {
  "level" : 2,
  "name" : "凉山",
  "pid" : "510000",
  "id" : "513400",
  "fullname" : "凉山彝族自治州"
}, {
  "level" : 2,
  "name" : "贵阳",
  "pid" : "520000",
  "id" : "520100",
  "fullname" : "贵阳市"
}, {
  "level" : 2,
  "name" : "六盘水",
  "pid" : "520000",
  "id" : "520200",
  "fullname" : "六盘水市"
}, {
  "level" : 2,
  "name" : "遵义",
  "pid" : "520000",
  "id" : "520300",
  "fullname" : "遵义市"
}, {
  "level" : 2,
  "name" : "安顺",
  "pid" : "520000",
  "id" : "520400",
  "fullname" : "安顺市"
}, {
  "level" : 2,
  "name" : "毕节",
  "pid" : "520000",
  "id" : "520500",
  "fullname" : "毕节市"
}, {
  "level" : 2,
  "name" : "铜仁",
  "pid" : "520000",
  "id" : "520600",
  "fullname" : "铜仁市"
}, {
  "level" : 2,
  "name" : "黔西南",
  "pid" : "520000",
  "id" : "522300",
  "fullname" : "黔西南布依族苗族自治州"
}, {
  "level" : 2,
  "name" : "黔东南",
  "pid" : "520000",
  "id" : "522600",
  "fullname" : "黔东南苗族侗族自治州"
}, {
  "level" : 2,
  "name" : "黔南",
  "pid" : "520000",
  "id" : "522700",
  "fullname" : "黔南布依族苗族自治州"
}, {
  "level" : 2,
  "name" : "昆明",
  "pid" : "530000",
  "id" : "530100",
  "fullname" : "昆明市"
}, {
  "level" : 2,
  "name" : "曲靖",
  "pid" : "530000",
  "id" : "530300",
  "fullname" : "曲靖市"
}, {
  "level" : 2,
  "name" : "玉溪",
  "pid" : "530000",
  "id" : "530400",
  "fullname" : "玉溪市"
}, {
  "level" : 2,
  "name" : "保山",
  "pid" : "530000",
  "id" : "530500",
  "fullname" : "保山市"
}, {
  "level" : 2,
  "name" : "昭通",
  "pid" : "530000",
  "id" : "530600",
  "fullname" : "昭通市"
}, {
  "level" : 2,
  "name" : "丽江",
  "pid" : "530000",
  "id" : "530700",
  "fullname" : "丽江市"
}, {
  "level" : 2,
  "name" : "普洱",
  "pid" : "530000",
  "id" : "530800",
  "fullname" : "普洱市"
}, {
  "level" : 2,
  "name" : "临沧",
  "pid" : "530000",
  "id" : "530900",
  "fullname" : "临沧市"
}, {
  "level" : 2,
  "name" : "楚雄",
  "pid" : "530000",
  "id" : "532300",
  "fullname" : "楚雄彝族自治州"
}, {
  "level" : 2,
  "name" : "红河",
  "pid" : "530000",
  "id" : "532500",
  "fullname" : "红河哈尼族彝族自治州"
}, {
  "level" : 2,
  "name" : "文山",
  "pid" : "530000",
  "id" : "532600",
  "fullname" : "文山壮族苗族自治州"
}, {
  "level" : 2,
  "name" : "西双版纳",
  "pid" : "530000",
  "id" : "532800",
  "fullname" : "西双版纳傣族自治州"
}, {
  "level" : 2,
  "name" : "大理",
  "pid" : "530000",
  "id" : "532900",
  "fullname" : "大理白族自治州"
}, {
  "level" : 2,
  "name" : "德宏",
  "pid" : "530000",
  "id" : "533100",
  "fullname" : "德宏傣族景颇族自治州"
}, {
  "level" : 2,
  "name" : "怒江",
  "pid" : "530000",
  "id" : "533300",
  "fullname" : "怒江傈僳族自治州"
}, {
  "level" : 2,
  "name" : "迪庆",
  "pid" : "530000",
  "id" : "533400",
  "fullname" : "迪庆藏族自治州"
}, {
  "level" : 2,
  "name" : "拉萨",
  "pid" : "540000",
  "id" : "540100",
  "fullname" : "拉萨市"
}, {
  "level" : 2,
  "name" : "日喀则",
  "pid" : "540000",
  "id" : "540200",
  "fullname" : "日喀则市"
}, {
  "level" : 2,
  "name" : "昌都",
  "pid" : "540000",
  "id" : "540300",
  "fullname" : "昌都市"
}, {
  "level" : 2,
  "name" : "林芝",
  "pid" : "540000",
  "id" : "540400",
  "fullname" : "林芝市"
}, {
  "level" : 2,
  "name" : "山南",
  "pid" : "540000",
  "id" : "540500",
  "fullname" : "山南市"
}, {
  "level" : 2,
  "name" : "那曲",
  "pid" : "540000",
  "id" : "540600",
  "fullname" : "那曲市"
}, {
  "level" : 2,
  "name" : "阿里",
  "pid" : "540000",
  "id" : "542500",
  "fullname" : "阿里地区"
}, {
  "level" : 2,
  "name" : "西安",
  "pid" : "610000",
  "id" : "610100",
  "fullname" : "西安市"
}, {
  "level" : 2,
  "name" : "铜川",
  "pid" : "610000",
  "id" : "610200",
  "fullname" : "铜川市"
}, {
  "level" : 2,
  "name" : "宝鸡",
  "pid" : "610000",
  "id" : "610300",
  "fullname" : "宝鸡市"
}, {
  "level" : 2,
  "name" : "咸阳",
  "pid" : "610000",
  "id" : "610400",
  "fullname" : "咸阳市"
}, {
  "level" : 2,
  "name" : "渭南",
  "pid" : "610000",
  "id" : "610500",
  "fullname" : "渭南市"
}, {
  "level" : 2,
  "name" : "延安",
  "pid" : "610000",
  "id" : "610600",
  "fullname" : "延安市"
}, {
  "level" : 2,
  "name" : "汉中",
  "pid" : "610000",
  "id" : "610700",
  "fullname" : "汉中市"
}, {
  "level" : 2,
  "name" : "榆林",
  "pid" : "610000",
  "id" : "610800",
  "fullname" : "榆林市"
}, {
  "level" : 2,
  "name" : "安康",
  "pid" : "610000",
  "id" : "610900",
  "fullname" : "安康市"
}, {
  "level" : 2,
  "name" : "商洛",
  "pid" : "610000",
  "id" : "611000",
  "fullname" : "商洛市"
}, {
  "level" : 2,
  "name" : "兰州",
  "pid" : "620000",
  "id" : "620100",
  "fullname" : "兰州市"
}, {
  "level" : 2,
  "name" : "嘉峪关",
  "pid" : "620000",
  "id" : "620200",
  "fullname" : "嘉峪关市"
}, {
  "level" : 2,
  "name" : "金昌",
  "pid" : "620000",
  "id" : "620300",
  "fullname" : "金昌市"
}, {
  "level" : 2,
  "name" : "白银",
  "pid" : "620000",
  "id" : "620400",
  "fullname" : "白银市"
}, {
  "level" : 2,
  "name" : "天水",
  "pid" : "620000",
  "id" : "620500",
  "fullname" : "天水市"
}, {
  "level" : 2,
  "name" : "武威",
  "pid" : "620000",
  "id" : "620600",
  "fullname" : "武威市"
}, {
  "level" : 2,
  "name" : "张掖",
  "pid" : "620000",
  "id" : "620700",
  "fullname" : "张掖市"
}, {
  "level" : 2,
  "name" : "平凉",
  "pid" : "620000",
  "id" : "620800",
  "fullname" : "平凉市"
}, {
  "level" : 2,
  "name" : "酒泉",
  "pid" : "620000",
  "id" : "620900",
  "fullname" : "酒泉市"
}, {
  "level" : 2,
  "name" : "庆阳",
  "pid" : "620000",
  "id" : "621000",
  "fullname" : "庆阳市"
}, {
  "level" : 2,
  "name" : "定西",
  "pid" : "620000",
  "id" : "621100",
  "fullname" : "定西市"
}, {
  "level" : 2,
  "name" : "陇南",
  "pid" : "620000",
  "id" : "621200",
  "fullname" : "陇南市"
}, {
  "level" : 2,
  "name" : "临夏",
  "pid" : "620000",
  "id" : "622900",
  "fullname" : "临夏回族自治州"
}, {
  "level" : 2,
  "name" : "甘南",
  "pid" : "620000",
  "id" : "623000",
  "fullname" : "甘南藏族自治州"
}, {
  "level" : 2,
  "name" : "西宁",
  "pid" : "630000",
  "id" : "630100",
  "fullname" : "西宁市"
}, {
  "level" : 2,
  "name" : "海东",
  "pid" : "630000",
  "id" : "630200",
  "fullname" : "海东市"
}, {
  "level" : 2,
  "name" : "海北",
  "pid" : "630000",
  "id" : "632200",
  "fullname" : "海北藏族自治州"
}, {
  "level" : 2,
  "name" : "黄南",
  "pid" : "630000",
  "id" : "632300",
  "fullname" : "黄南藏族自治州"
}, {
  "level" : 2,
  "name" : "海南",
  "pid" : "630000",
  "id" : "632500",
  "fullname" : "海南藏族自治州"
}, {
  "level" : 2,
  "name" : "果洛",
  "pid" : "630000",
  "id" : "632600",
  "fullname" : "果洛藏族自治州"
}, {
  "level" : 2,
  "name" : "玉树",
  "pid" : "630000",
  "id" : "632700",
  "fullname" : "玉树藏族自治州"
}, {
  "level" : 2,
  "name" : "海西",
  "pid" : "630000",
  "id" : "632800",
  "fullname" : "海西蒙古族藏族自治州"
}, {
  "level" : 2,
  "name" : "银川",
  "pid" : "640000",
  "id" : "640100",
  "fullname" : "银川市"
}, {
  "level" : 2,
  "name" : "石嘴山",
  "pid" : "640000",
  "id" : "640200",
  "fullname" : "石嘴山市"
}, {
  "level" : 2,
  "name" : "吴忠",
  "pid" : "640000",
  "id" : "640300",
  "fullname" : "吴忠市"
}, {
  "level" : 2,
  "name" : "固原",
  "pid" : "640000",
  "id" : "640400",
  "fullname" : "固原市"
}, {
  "level" : 2,
  "name" : "中卫",
  "pid" : "640000",
  "id" : "640500",
  "fullname" : "中卫市"
}, {
  "level" : 2,
  "name" : "乌鲁木齐",
  "pid" : "650000",
  "id" : "650100",
  "fullname" : "乌鲁木齐市"
}, {
  "level" : 2,
  "name" : "克拉玛依",
  "pid" : "650000",
  "id" : "650200",
  "fullname" : "克拉玛依市"
}, {
  "level" : 2,
  "name" : "吐鲁番",
  "pid" : "650000",
  "id" : "650400",
  "fullname" : "吐鲁番市"
}, {
  "level" : 2,
  "name" : "哈密",
  "pid" : "650000",
  "id" : "650500",
  "fullname" : "哈密市"
}, {
  "level" : 2,
  "name" : "昌吉",
  "pid" : "650000",
  "id" : "652300",
  "fullname" : "昌吉回族自治州"
}, {
  "level" : 2,
  "name" : "博州",
  "pid" : "650000",
  "id" : "652700",
  "fullname" : "博尔塔拉蒙古自治州"
}, {
  "level" : 2,
  "name" : "巴州",
  "pid" : "650000",
  "id" : "652800",
  "fullname" : "巴音郭楞蒙古自治州"
}, {
  "level" : 2,
  "name" : "阿克苏",
  "pid" : "650000",
  "id" : "652900",
  "fullname" : "阿克苏地区"
}, {
  "level" : 2,
  "name" : "克州",
  "pid" : "650000",
  "id" : "653000",
  "fullname" : "克孜勒苏柯尔克孜自治州"
}, {
  "level" : 2,
  "name" : "喀什",
  "pid" : "650000",
  "id" : "653100",
  "fullname" : "喀什地区"
}, {
  "level" : 2,
  "name" : "和田",
  "pid" : "650000",
  "id" : "653200",
  "fullname" : "和田地区"
}, {
  "level" : 2,
  "name" : "伊犁",
  "pid" : "650000",
  "id" : "654000",
  "fullname" : "伊犁哈萨克自治州"
}, {
  "level" : 2,
  "name" : "塔城",
  "pid" : "650000",
  "id" : "654200",
  "fullname" : "塔城地区"
}, {
  "level" : 2,
  "name" : "阿勒泰",
  "pid" : "650000",
  "id" : "654300",
  "fullname" : "阿勒泰地区"
}, {
  "level" : 2,
  "name" : "石河子",
  "pid" : "650000",
  "id" : "659001",
  "fullname" : "石河子市"
}, {
  "level" : 2,
  "name" : "阿拉尔",
  "pid" : "650000",
  "id" : "659002",
  "fullname" : "阿拉尔市"
}, {
  "level" : 2,
  "name" : "图木舒克",
  "pid" : "650000",
  "id" : "659003",
  "fullname" : "图木舒克市"
}, {
  "level" : 2,
  "name" : "五家渠",
  "pid" : "650000",
  "id" : "659004",
  "fullname" : "五家渠市"
}, {
  "level" : 2,
  "name" : "北屯",
  "pid" : "650000",
  "id" : "659005",
  "fullname" : "北屯市"
}, {
  "level" : 2,
  "name" : "铁门关",
  "pid" : "650000",
  "id" : "659006",
  "fullname" : "铁门关市"
}, {
  "level" : 2,
  "name" : "双河",
  "pid" : "650000",
  "id" : "659007",
  "fullname" : "双河市"
}, {
  "level" : 2,
  "name" : "可克达拉",
  "pid" : "650000",
  "id" : "659008",
  "fullname" : "可克达拉市"
}, {
  "level" : 2,
  "name" : "昆玉",
  "pid" : "650000",
  "id" : "659009",
  "fullname" : "昆玉市"
}, {
  "level" : 2,
  "name" : "胡杨河",
  "pid" : "650000",
  "id" : "659010",
  "fullname" : "胡杨河市"
}, {
  "level" : 2,
  "name" : "台北",
  "pid" : "710000",
  "id" : "710100",
  "fullname" : "台北市"
}, {
  "level" : 2,
  "name" : "高雄",
  "pid" : "710000",
  "id" : "710200",
  "fullname" : "高雄市"
}, {
  "level" : 2,
  "name" : "台南",
  "pid" : "710000",
  "id" : "710300",
  "fullname" : "台南市"
}, {
  "level" : 2,
  "name" : "台中",
  "pid" : "710000",
  "id" : "710400",
  "fullname" : "台中市"
}, {
  "level" : 2,
  "name" : "南投",
  "pid" : "710000",
  "id" : "710600",
  "fullname" : "南投县"
}, {
  "level" : 2,
  "name" : "基隆",
  "pid" : "710000",
  "id" : "710700",
  "fullname" : "基隆市"
}, {
  "level" : 2,
  "name" : "新竹",
  "pid" : "710000",
  "id" : "710800",
  "fullname" : "新竹市"
}, {
  "level" : 2,
  "name" : "嘉义",
  "pid" : "710000",
  "id" : "710900",
  "fullname" : "嘉义市"
}, {
  "level" : 2,
  "name" : "新北",
  "pid" : "710000",
  "id" : "711100",
  "fullname" : "新北市"
}, {
  "level" : 2,
  "name" : "宜兰",
  "pid" : "710000",
  "id" : "711200",
  "fullname" : "宜兰县"
}, {
  "level" : 2,
  "name" : "新竹",
  "pid" : "710000",
  "id" : "711300",
  "fullname" : "新竹县"
}, {
  "level" : 2,
  "name" : "桃园",
  "pid" : "710000",
  "id" : "711400",
  "fullname" : "桃园市"
}, {
  "level" : 2,
  "name" : "苗栗",
  "pid" : "710000",
  "id" : "711500",
  "fullname" : "苗栗县"
}, {
  "level" : 2,
  "name" : "彰化",
  "pid" : "710000",
  "id" : "711700",
  "fullname" : "彰化县"
}, {
  "level" : 2,
  "name" : "嘉义",
  "pid" : "710000",
  "id" : "711900",
  "fullname" : "嘉义县"
}, {
  "level" : 2,
  "name" : "云林",
  "pid" : "710000",
  "id" : "712100",
  "fullname" : "云林县"
}, {
  "level" : 2,
  "name" : "屏东",
  "pid" : "710000",
  "id" : "712400",
  "fullname" : "屏东县"
}, {
  "level" : 2,
  "name" : "台东",
  "pid" : "710000",
  "id" : "712500",
  "fullname" : "台东县"
}, {
  "level" : 2,
  "name" : "花莲",
  "pid" : "710000",
  "id" : "712600",
  "fullname" : "花莲县"
}, {
  "level" : 2,
  "name" : "澎湖",
  "pid" : "710000",
  "id" : "712700",
  "fullname" : "澎湖县"
}, {
  "level" : 2,
  "name" : "中西区",
  "pid" : "810000",
  "id" : "810101",
  "fullname" : "中西区"
}, {
  "level" : 2,
  "name" : "东区",
  "pid" : "810000",
  "id" : "810102",
  "fullname" : "东区"
}, {
  "level" : 2,
  "name" : "九龙",
  "pid" : "810000",
  "id" : "810103",
  "fullname" : "九龙城区"
}, {
  "level" : 2,
  "name" : "观塘区",
  "pid" : "810000",
  "id" : "810104",
  "fullname" : "观塘区"
}, {
  "level" : 2,
  "name" : "南区",
  "pid" : "810000",
  "id" : "810105",
  "fullname" : "南区"
}, {
  "level" : 2,
  "name" : "深水埗区",
  "pid" : "810000",
  "id" : "810106",
  "fullname" : "深水埗区"
}, {
  "level" : 2,
  "name" : "湾仔区",
  "pid" : "810000",
  "id" : "810107",
  "fullname" : "湾仔区"
}, {
  "level" : 2,
  "name" : "黄大仙区",
  "pid" : "810000",
  "id" : "810108",
  "fullname" : "黄大仙区"
}, {
  "level" : 2,
  "name" : "油尖旺区",
  "pid" : "810000",
  "id" : "810109",
  "fullname" : "油尖旺区"
}, {
  "level" : 2,
  "name" : "离岛区",
  "pid" : "810000",
  "id" : "810110",
  "fullname" : "离岛区"
}, {
  "level" : 2,
  "name" : "葵青区",
  "pid" : "810000",
  "id" : "810111",
  "fullname" : "葵青区"
}, {
  "level" : 2,
  "name" : "北区",
  "pid" : "810000",
  "id" : "810112",
  "fullname" : "北区"
}, {
  "level" : 2,
  "name" : "西贡区",
  "pid" : "810000",
  "id" : "810113",
  "fullname" : "西贡区"
}, {
  "level" : 2,
  "name" : "沙田区",
  "pid" : "810000",
  "id" : "810114",
  "fullname" : "沙田区"
}, {
  "level" : 2,
  "name" : "屯门区",
  "pid" : "810000",
  "id" : "810115",
  "fullname" : "屯门区"
}, {
  "level" : 2,
  "name" : "大埔区",
  "pid" : "810000",
  "id" : "810116",
  "fullname" : "大埔区"
}, {
  "level" : 2,
  "name" : "荃湾区",
  "pid" : "810000",
  "id" : "810117",
  "fullname" : "荃湾区"
}, {
  "level" : 2,
  "name" : "元朗区",
  "pid" : "810000",
  "id" : "810118",
  "fullname" : "元朗区"
}, {
  "level" : 2,
  "name" : "澳门半岛",
  "pid" : "820000",
  "id" : "820101",
  "fullname" : "澳门半岛"
}, {
  "level" : 2,
  "name" : "凼仔",
  "pid" : "820000",
  "id" : "820102",
  "fullname" : "凼仔"
}, {
  "level" : 2,
  "name" : "路凼城",
  "pid" : "820000",
  "id" : "820103",
  "fullname" : "路凼城"
}, {
  "level" : 2,
  "name" : "路环",
  "pid" : "820000",
  "id" : "820104",
  "fullname" : "路环"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130102",
  "fullname" : "长安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130104",
  "fullname" : "桥西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130105",
  "fullname" : "新华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130107",
  "fullname" : "井陉矿区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130108",
  "fullname" : "裕华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130109",
  "fullname" : "藁城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130110",
  "fullname" : "鹿泉区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130111",
  "fullname" : "栾城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130121",
  "fullname" : "井陉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130123",
  "fullname" : "正定县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130125",
  "fullname" : "行唐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130126",
  "fullname" : "灵寿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130127",
  "fullname" : "高邑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130128",
  "fullname" : "深泽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130129",
  "fullname" : "赞皇县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130130",
  "fullname" : "无极县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130131",
  "fullname" : "平山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130132",
  "fullname" : "元氏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130133",
  "fullname" : "赵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130181",
  "fullname" : "辛集市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130183",
  "fullname" : "晋州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130100",
  "id" : "130184",
  "fullname" : "新乐市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130202",
  "fullname" : "路南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130203",
  "fullname" : "路北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130204",
  "fullname" : "古冶区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130205",
  "fullname" : "开平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130207",
  "fullname" : "丰南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130208",
  "fullname" : "丰润区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130209",
  "fullname" : "曹妃甸区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130224",
  "fullname" : "滦南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130225",
  "fullname" : "乐亭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130227",
  "fullname" : "迁西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130229",
  "fullname" : "玉田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130230",
  "fullname" : "芦台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130281",
  "fullname" : "遵化市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130283",
  "fullname" : "迁安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130200",
  "id" : "130284",
  "fullname" : "滦州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130300",
  "id" : "130302",
  "fullname" : "海港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130300",
  "id" : "130303",
  "fullname" : "山海关区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130300",
  "id" : "130304",
  "fullname" : "北戴河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130300",
  "id" : "130306",
  "fullname" : "抚宁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130300",
  "id" : "130321",
  "fullname" : "青龙满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130300",
  "id" : "130322",
  "fullname" : "昌黎县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130300",
  "id" : "130324",
  "fullname" : "卢龙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130402",
  "fullname" : "邯山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130403",
  "fullname" : "丛台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130404",
  "fullname" : "复兴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130406",
  "fullname" : "峰峰矿区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130407",
  "fullname" : "肥乡区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130408",
  "fullname" : "永年区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130423",
  "fullname" : "临漳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130424",
  "fullname" : "成安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130425",
  "fullname" : "大名县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130426",
  "fullname" : "涉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130427",
  "fullname" : "磁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130430",
  "fullname" : "邱县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130431",
  "fullname" : "鸡泽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130432",
  "fullname" : "广平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130433",
  "fullname" : "馆陶县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130434",
  "fullname" : "魏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130435",
  "fullname" : "曲周县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130400",
  "id" : "130481",
  "fullname" : "武安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130502",
  "fullname" : "襄都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130503",
  "fullname" : "信都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130505",
  "fullname" : "任泽区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130506",
  "fullname" : "南和区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130522",
  "fullname" : "临城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130523",
  "fullname" : "内丘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130524",
  "fullname" : "柏乡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130525",
  "fullname" : "隆尧县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130528",
  "fullname" : "宁晋县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130529",
  "fullname" : "巨鹿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130530",
  "fullname" : "新河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130531",
  "fullname" : "广宗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130532",
  "fullname" : "平乡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130533",
  "fullname" : "威县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130534",
  "fullname" : "清河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130535",
  "fullname" : "临西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130581",
  "fullname" : "南宫市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130500",
  "id" : "130582",
  "fullname" : "沙河市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130602",
  "fullname" : "竞秀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130606",
  "fullname" : "莲池区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130607",
  "fullname" : "满城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130608",
  "fullname" : "清苑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130609",
  "fullname" : "徐水区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130623",
  "fullname" : "涞水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130624",
  "fullname" : "阜平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130626",
  "fullname" : "定兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130627",
  "fullname" : "唐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130628",
  "fullname" : "高阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130629",
  "fullname" : "容城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130630",
  "fullname" : "涞源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130631",
  "fullname" : "望都县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130632",
  "fullname" : "安新县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130633",
  "fullname" : "易县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130634",
  "fullname" : "曲阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130635",
  "fullname" : "蠡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130636",
  "fullname" : "顺平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130637",
  "fullname" : "博野县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130638",
  "fullname" : "雄县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130681",
  "fullname" : "涿州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130682",
  "fullname" : "定州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130683",
  "fullname" : "安国市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130600",
  "id" : "130684",
  "fullname" : "高碑店市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130702",
  "fullname" : "桥东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130703",
  "fullname" : "桥西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130705",
  "fullname" : "宣化区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130706",
  "fullname" : "下花园区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130708",
  "fullname" : "万全区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130709",
  "fullname" : "崇礼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130722",
  "fullname" : "张北县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130723",
  "fullname" : "康保县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130724",
  "fullname" : "沽源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130725",
  "fullname" : "尚义县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130726",
  "fullname" : "蔚县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130727",
  "fullname" : "阳原县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130728",
  "fullname" : "怀安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130730",
  "fullname" : "怀来县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130731",
  "fullname" : "涿鹿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130700",
  "id" : "130732",
  "fullname" : "赤城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130802",
  "fullname" : "双桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130803",
  "fullname" : "双滦区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130804",
  "fullname" : "鹰手营子矿区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130821",
  "fullname" : "承德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130822",
  "fullname" : "兴隆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130824",
  "fullname" : "滦平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130825",
  "fullname" : "隆化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130826",
  "fullname" : "丰宁满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130827",
  "fullname" : "宽城满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130828",
  "fullname" : "围场满族蒙古族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130800",
  "id" : "130881",
  "fullname" : "平泉市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130902",
  "fullname" : "新华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130903",
  "fullname" : "运河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130921",
  "fullname" : "沧县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130922",
  "fullname" : "青县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130923",
  "fullname" : "东光县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130924",
  "fullname" : "海兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130925",
  "fullname" : "盐山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130926",
  "fullname" : "肃宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130927",
  "fullname" : "南皮县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130928",
  "fullname" : "吴桥县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130929",
  "fullname" : "献县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130930",
  "fullname" : "孟村回族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130981",
  "fullname" : "泊头市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130982",
  "fullname" : "任丘市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130983",
  "fullname" : "黄骅市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "130900",
  "id" : "130984",
  "fullname" : "河间市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131002",
  "fullname" : "安次区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131003",
  "fullname" : "广阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131022",
  "fullname" : "固安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131023",
  "fullname" : "永清县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131024",
  "fullname" : "香河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131025",
  "fullname" : "大城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131026",
  "fullname" : "文安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131028",
  "fullname" : "大厂回族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131081",
  "fullname" : "霸州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131000",
  "id" : "131082",
  "fullname" : "三河市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131102",
  "fullname" : "桃城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131103",
  "fullname" : "冀州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131121",
  "fullname" : "枣强县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131122",
  "fullname" : "武邑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131123",
  "fullname" : "武强县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131124",
  "fullname" : "饶阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131125",
  "fullname" : "安平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131126",
  "fullname" : "故城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131127",
  "fullname" : "景县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131128",
  "fullname" : "阜城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "131100",
  "id" : "131182",
  "fullname" : "深州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140105",
  "fullname" : "小店区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140106",
  "fullname" : "迎泽区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140107",
  "fullname" : "杏花岭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140108",
  "fullname" : "尖草坪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140109",
  "fullname" : "万柏林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140110",
  "fullname" : "晋源区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140121",
  "fullname" : "清徐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140122",
  "fullname" : "阳曲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140123",
  "fullname" : "娄烦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140100",
  "id" : "140181",
  "fullname" : "古交市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140212",
  "fullname" : "新荣区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140213",
  "fullname" : "平城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140214",
  "fullname" : "云冈区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140215",
  "fullname" : "云州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140221",
  "fullname" : "阳高县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140222",
  "fullname" : "天镇县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140223",
  "fullname" : "广灵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140224",
  "fullname" : "灵丘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140225",
  "fullname" : "浑源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140200",
  "id" : "140226",
  "fullname" : "左云县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140300",
  "id" : "140302",
  "fullname" : "城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140300",
  "id" : "140303",
  "fullname" : "矿区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140300",
  "id" : "140311",
  "fullname" : "郊区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140300",
  "id" : "140321",
  "fullname" : "平定县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140300",
  "id" : "140322",
  "fullname" : "盂县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140403",
  "fullname" : "潞州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140404",
  "fullname" : "上党区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140405",
  "fullname" : "屯留区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140406",
  "fullname" : "潞城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140423",
  "fullname" : "襄垣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140425",
  "fullname" : "平顺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140426",
  "fullname" : "黎城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140427",
  "fullname" : "壶关县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140428",
  "fullname" : "长子县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140429",
  "fullname" : "武乡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140430",
  "fullname" : "沁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140400",
  "id" : "140431",
  "fullname" : "沁源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140500",
  "id" : "140502",
  "fullname" : "城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140500",
  "id" : "140521",
  "fullname" : "沁水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140500",
  "id" : "140522",
  "fullname" : "阳城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140500",
  "id" : "140524",
  "fullname" : "陵川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140500",
  "id" : "140525",
  "fullname" : "泽州县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140500",
  "id" : "140581",
  "fullname" : "高平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140600",
  "id" : "140602",
  "fullname" : "朔城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140600",
  "id" : "140603",
  "fullname" : "平鲁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140600",
  "id" : "140621",
  "fullname" : "山阴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140600",
  "id" : "140622",
  "fullname" : "应县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140600",
  "id" : "140623",
  "fullname" : "右玉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140600",
  "id" : "140681",
  "fullname" : "怀仁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140702",
  "fullname" : "榆次区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140703",
  "fullname" : "太谷区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140721",
  "fullname" : "榆社县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140722",
  "fullname" : "左权县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140723",
  "fullname" : "和顺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140724",
  "fullname" : "昔阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140725",
  "fullname" : "寿阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140727",
  "fullname" : "祁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140728",
  "fullname" : "平遥县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140729",
  "fullname" : "灵石县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140700",
  "id" : "140781",
  "fullname" : "介休市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140802",
  "fullname" : "盐湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140821",
  "fullname" : "临猗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140822",
  "fullname" : "万荣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140823",
  "fullname" : "闻喜县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140824",
  "fullname" : "稷山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140825",
  "fullname" : "新绛县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140826",
  "fullname" : "绛县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140827",
  "fullname" : "垣曲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140828",
  "fullname" : "夏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140829",
  "fullname" : "平陆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140830",
  "fullname" : "芮城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140881",
  "fullname" : "永济市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140800",
  "id" : "140882",
  "fullname" : "河津市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140902",
  "fullname" : "忻府区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140921",
  "fullname" : "定襄县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140922",
  "fullname" : "五台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140923",
  "fullname" : "代县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140924",
  "fullname" : "繁峙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140925",
  "fullname" : "宁武县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140926",
  "fullname" : "静乐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140927",
  "fullname" : "神池县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140928",
  "fullname" : "五寨县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140929",
  "fullname" : "岢岚县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140930",
  "fullname" : "河曲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140931",
  "fullname" : "保德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140932",
  "fullname" : "偏关县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "140900",
  "id" : "140981",
  "fullname" : "原平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141002",
  "fullname" : "尧都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141021",
  "fullname" : "曲沃县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141022",
  "fullname" : "翼城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141023",
  "fullname" : "襄汾县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141024",
  "fullname" : "洪洞县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141025",
  "fullname" : "古县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141026",
  "fullname" : "安泽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141027",
  "fullname" : "浮山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141028",
  "fullname" : "吉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141029",
  "fullname" : "乡宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141030",
  "fullname" : "大宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141031",
  "fullname" : "隰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141032",
  "fullname" : "永和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141033",
  "fullname" : "蒲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141034",
  "fullname" : "汾西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141081",
  "fullname" : "侯马市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141000",
  "id" : "141082",
  "fullname" : "霍州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141102",
  "fullname" : "离石区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141121",
  "fullname" : "文水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141122",
  "fullname" : "交城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141123",
  "fullname" : "兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141124",
  "fullname" : "临县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141125",
  "fullname" : "柳林县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141126",
  "fullname" : "石楼县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141127",
  "fullname" : "岚县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141128",
  "fullname" : "方山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141129",
  "fullname" : "中阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141130",
  "fullname" : "交口县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141181",
  "fullname" : "孝义市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "141100",
  "id" : "141182",
  "fullname" : "汾阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150102",
  "fullname" : "新城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150103",
  "fullname" : "回民区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150104",
  "fullname" : "玉泉区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150105",
  "fullname" : "赛罕区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150121",
  "fullname" : "土默特左旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150122",
  "fullname" : "托克托县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150123",
  "fullname" : "和林格尔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150124",
  "fullname" : "清水河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150100",
  "id" : "150125",
  "fullname" : "武川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150202",
  "fullname" : "东河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150203",
  "fullname" : "昆都仑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150204",
  "fullname" : "青山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150205",
  "fullname" : "石拐区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150206",
  "fullname" : "白云鄂博矿区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150207",
  "fullname" : "九原区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150221",
  "fullname" : "土默特右旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150222",
  "fullname" : "固阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150200",
  "id" : "150223",
  "fullname" : "达尔罕茂明安联合旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150300",
  "id" : "150302",
  "fullname" : "海勃湾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150300",
  "id" : "150303",
  "fullname" : "海南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150300",
  "id" : "150304",
  "fullname" : "乌达区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150402",
  "fullname" : "红山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150403",
  "fullname" : "元宝山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150404",
  "fullname" : "松山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150421",
  "fullname" : "阿鲁科尔沁旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150422",
  "fullname" : "巴林左旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150423",
  "fullname" : "巴林右旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150424",
  "fullname" : "林西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150425",
  "fullname" : "克什克腾旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150426",
  "fullname" : "翁牛特旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150428",
  "fullname" : "喀喇沁旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150429",
  "fullname" : "宁城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150400",
  "id" : "150430",
  "fullname" : "敖汉旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150500",
  "id" : "150502",
  "fullname" : "科尔沁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150500",
  "id" : "150521",
  "fullname" : "科尔沁左翼中旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150500",
  "id" : "150522",
  "fullname" : "科尔沁左翼后旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150500",
  "id" : "150523",
  "fullname" : "开鲁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150500",
  "id" : "150524",
  "fullname" : "库伦旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150500",
  "id" : "150525",
  "fullname" : "奈曼旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150500",
  "id" : "150526",
  "fullname" : "扎鲁特旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150500",
  "id" : "150581",
  "fullname" : "霍林郭勒市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150602",
  "fullname" : "东胜区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150603",
  "fullname" : "康巴什区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150621",
  "fullname" : "达拉特旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150622",
  "fullname" : "准格尔旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150623",
  "fullname" : "鄂托克前旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150624",
  "fullname" : "鄂托克旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150625",
  "fullname" : "杭锦旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150626",
  "fullname" : "乌审旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150600",
  "id" : "150627",
  "fullname" : "伊金霍洛旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150702",
  "fullname" : "海拉尔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150703",
  "fullname" : "扎赉诺尔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150721",
  "fullname" : "阿荣旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150722",
  "fullname" : "莫力达瓦达斡尔族自治旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150723",
  "fullname" : "鄂伦春自治旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150724",
  "fullname" : "鄂温克族自治旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150725",
  "fullname" : "陈巴尔虎旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150726",
  "fullname" : "新巴尔虎左旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150727",
  "fullname" : "新巴尔虎右旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150781",
  "fullname" : "满洲里市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150782",
  "fullname" : "牙克石市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150783",
  "fullname" : "扎兰屯市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150784",
  "fullname" : "额尔古纳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150700",
  "id" : "150785",
  "fullname" : "根河市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150800",
  "id" : "150802",
  "fullname" : "临河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150800",
  "id" : "150821",
  "fullname" : "五原县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150800",
  "id" : "150822",
  "fullname" : "磴口县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150800",
  "id" : "150823",
  "fullname" : "乌拉特前旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150800",
  "id" : "150824",
  "fullname" : "乌拉特中旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150800",
  "id" : "150825",
  "fullname" : "乌拉特后旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150800",
  "id" : "150826",
  "fullname" : "杭锦后旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150902",
  "fullname" : "集宁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150921",
  "fullname" : "卓资县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150922",
  "fullname" : "化德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150923",
  "fullname" : "商都县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150924",
  "fullname" : "兴和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150925",
  "fullname" : "凉城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150926",
  "fullname" : "察哈尔右翼前旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150927",
  "fullname" : "察哈尔右翼中旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150928",
  "fullname" : "察哈尔右翼后旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150929",
  "fullname" : "四子王旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "150900",
  "id" : "150981",
  "fullname" : "丰镇市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152200",
  "id" : "152201",
  "fullname" : "乌兰浩特市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152200",
  "id" : "152202",
  "fullname" : "阿尔山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152200",
  "id" : "152221",
  "fullname" : "科尔沁右翼前旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152200",
  "id" : "152222",
  "fullname" : "科尔沁右翼中旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152200",
  "id" : "152223",
  "fullname" : "扎赉特旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152200",
  "id" : "152224",
  "fullname" : "突泉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152501",
  "fullname" : "二连浩特市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152502",
  "fullname" : "锡林浩特市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152522",
  "fullname" : "阿巴嘎旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152523",
  "fullname" : "苏尼特左旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152524",
  "fullname" : "苏尼特右旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152525",
  "fullname" : "东乌珠穆沁旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152526",
  "fullname" : "西乌珠穆沁旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152527",
  "fullname" : "太仆寺旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152528",
  "fullname" : "镶黄旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152529",
  "fullname" : "正镶白旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152530",
  "fullname" : "正蓝旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152500",
  "id" : "152531",
  "fullname" : "多伦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152900",
  "id" : "152921",
  "fullname" : "阿拉善左旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152900",
  "id" : "152922",
  "fullname" : "阿拉善右旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "152900",
  "id" : "152923",
  "fullname" : "额济纳旗"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210102",
  "fullname" : "和平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210103",
  "fullname" : "沈河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210104",
  "fullname" : "大东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210105",
  "fullname" : "皇姑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210106",
  "fullname" : "铁西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210111",
  "fullname" : "苏家屯区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210112",
  "fullname" : "浑南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210113",
  "fullname" : "沈北新区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210114",
  "fullname" : "于洪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210115",
  "fullname" : "辽中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210123",
  "fullname" : "康平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210124",
  "fullname" : "法库县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210100",
  "id" : "210181",
  "fullname" : "新民市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210202",
  "fullname" : "中山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210203",
  "fullname" : "西岗区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210204",
  "fullname" : "沙河口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210211",
  "fullname" : "甘井子区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210212",
  "fullname" : "旅顺口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210213",
  "fullname" : "金州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210214",
  "fullname" : "普兰店区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210224",
  "fullname" : "长海县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210281",
  "fullname" : "瓦房店市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210200",
  "id" : "210283",
  "fullname" : "庄河市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210300",
  "id" : "210302",
  "fullname" : "铁东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210300",
  "id" : "210303",
  "fullname" : "铁西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210300",
  "id" : "210304",
  "fullname" : "立山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210300",
  "id" : "210311",
  "fullname" : "千山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210300",
  "id" : "210321",
  "fullname" : "台安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210300",
  "id" : "210323",
  "fullname" : "岫岩满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210300",
  "id" : "210381",
  "fullname" : "海城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210400",
  "id" : "210402",
  "fullname" : "新抚区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210400",
  "id" : "210403",
  "fullname" : "东洲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210400",
  "id" : "210404",
  "fullname" : "望花区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210400",
  "id" : "210411",
  "fullname" : "顺城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210400",
  "id" : "210421",
  "fullname" : "抚顺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210400",
  "id" : "210422",
  "fullname" : "新宾满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210400",
  "id" : "210423",
  "fullname" : "清原满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210500",
  "id" : "210502",
  "fullname" : "平山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210500",
  "id" : "210503",
  "fullname" : "溪湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210500",
  "id" : "210504",
  "fullname" : "明山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210500",
  "id" : "210505",
  "fullname" : "南芬区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210500",
  "id" : "210521",
  "fullname" : "本溪满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210500",
  "id" : "210522",
  "fullname" : "桓仁满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210600",
  "id" : "210602",
  "fullname" : "元宝区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210600",
  "id" : "210603",
  "fullname" : "振兴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210600",
  "id" : "210604",
  "fullname" : "振安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210600",
  "id" : "210624",
  "fullname" : "宽甸满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210600",
  "id" : "210681",
  "fullname" : "东港市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210600",
  "id" : "210682",
  "fullname" : "凤城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210700",
  "id" : "210702",
  "fullname" : "古塔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210700",
  "id" : "210703",
  "fullname" : "凌河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210700",
  "id" : "210711",
  "fullname" : "太和区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210700",
  "id" : "210726",
  "fullname" : "黑山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210700",
  "id" : "210727",
  "fullname" : "义县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210700",
  "id" : "210781",
  "fullname" : "凌海市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210700",
  "id" : "210782",
  "fullname" : "北镇市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210800",
  "id" : "210802",
  "fullname" : "站前区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210800",
  "id" : "210803",
  "fullname" : "西市区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210800",
  "id" : "210804",
  "fullname" : "鲅鱼圈区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210800",
  "id" : "210811",
  "fullname" : "老边区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210800",
  "id" : "210881",
  "fullname" : "盖州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210800",
  "id" : "210882",
  "fullname" : "大石桥市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210900",
  "id" : "210902",
  "fullname" : "海州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210900",
  "id" : "210903",
  "fullname" : "新邱区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210900",
  "id" : "210904",
  "fullname" : "太平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210900",
  "id" : "210905",
  "fullname" : "清河门区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210900",
  "id" : "210911",
  "fullname" : "细河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210900",
  "id" : "210921",
  "fullname" : "阜新蒙古族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "210900",
  "id" : "210922",
  "fullname" : "彰武县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211000",
  "id" : "211002",
  "fullname" : "白塔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211000",
  "id" : "211003",
  "fullname" : "文圣区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211000",
  "id" : "211004",
  "fullname" : "宏伟区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211000",
  "id" : "211005",
  "fullname" : "弓长岭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211000",
  "id" : "211011",
  "fullname" : "太子河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211000",
  "id" : "211021",
  "fullname" : "辽阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211000",
  "id" : "211081",
  "fullname" : "灯塔市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211100",
  "id" : "211102",
  "fullname" : "双台子区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211100",
  "id" : "211103",
  "fullname" : "兴隆台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211100",
  "id" : "211104",
  "fullname" : "大洼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211100",
  "id" : "211122",
  "fullname" : "盘山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211200",
  "id" : "211202",
  "fullname" : "银州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211200",
  "id" : "211204",
  "fullname" : "清河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211200",
  "id" : "211221",
  "fullname" : "铁岭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211200",
  "id" : "211223",
  "fullname" : "西丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211200",
  "id" : "211224",
  "fullname" : "昌图县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211200",
  "id" : "211281",
  "fullname" : "调兵山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211200",
  "id" : "211282",
  "fullname" : "开原市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211300",
  "id" : "211302",
  "fullname" : "双塔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211300",
  "id" : "211303",
  "fullname" : "龙城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211300",
  "id" : "211321",
  "fullname" : "朝阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211300",
  "id" : "211322",
  "fullname" : "建平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211300",
  "id" : "211324",
  "fullname" : "喀喇沁左翼蒙古族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211300",
  "id" : "211381",
  "fullname" : "北票市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211300",
  "id" : "211382",
  "fullname" : "凌源市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211400",
  "id" : "211402",
  "fullname" : "连山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211400",
  "id" : "211403",
  "fullname" : "龙港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211400",
  "id" : "211404",
  "fullname" : "南票区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211400",
  "id" : "211421",
  "fullname" : "绥中县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211400",
  "id" : "211422",
  "fullname" : "建昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "211400",
  "id" : "211481",
  "fullname" : "兴城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220102",
  "fullname" : "南关区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220103",
  "fullname" : "宽城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220104",
  "fullname" : "朝阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220105",
  "fullname" : "二道区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220106",
  "fullname" : "绿园区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220112",
  "fullname" : "双阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220113",
  "fullname" : "九台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220122",
  "fullname" : "农安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220182",
  "fullname" : "榆树市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220183",
  "fullname" : "德惠市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220100",
  "id" : "220184",
  "fullname" : "公主岭市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220202",
  "fullname" : "昌邑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220203",
  "fullname" : "龙潭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220204",
  "fullname" : "船营区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220211",
  "fullname" : "丰满区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220221",
  "fullname" : "永吉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220281",
  "fullname" : "蛟河市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220282",
  "fullname" : "桦甸市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220283",
  "fullname" : "舒兰市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220200",
  "id" : "220284",
  "fullname" : "磐石市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220300",
  "id" : "220302",
  "fullname" : "铁西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220300",
  "id" : "220303",
  "fullname" : "铁东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220300",
  "id" : "220322",
  "fullname" : "梨树县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220300",
  "id" : "220323",
  "fullname" : "伊通满族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220300",
  "id" : "220382",
  "fullname" : "双辽市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220400",
  "id" : "220402",
  "fullname" : "龙山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220400",
  "id" : "220403",
  "fullname" : "西安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220400",
  "id" : "220421",
  "fullname" : "东丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220400",
  "id" : "220422",
  "fullname" : "东辽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220500",
  "id" : "220502",
  "fullname" : "东昌区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220500",
  "id" : "220503",
  "fullname" : "二道江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220500",
  "id" : "220521",
  "fullname" : "通化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220500",
  "id" : "220523",
  "fullname" : "辉南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220500",
  "id" : "220524",
  "fullname" : "柳河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220500",
  "id" : "220581",
  "fullname" : "梅河口市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220500",
  "id" : "220582",
  "fullname" : "集安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220600",
  "id" : "220602",
  "fullname" : "浑江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220600",
  "id" : "220605",
  "fullname" : "江源区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220600",
  "id" : "220621",
  "fullname" : "抚松县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220600",
  "id" : "220622",
  "fullname" : "靖宇县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220600",
  "id" : "220623",
  "fullname" : "长白朝鲜族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220600",
  "id" : "220681",
  "fullname" : "临江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220700",
  "id" : "220702",
  "fullname" : "宁江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220700",
  "id" : "220721",
  "fullname" : "前郭尔罗斯蒙古族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220700",
  "id" : "220722",
  "fullname" : "长岭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220700",
  "id" : "220723",
  "fullname" : "乾安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220700",
  "id" : "220781",
  "fullname" : "扶余市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220800",
  "id" : "220802",
  "fullname" : "洮北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220800",
  "id" : "220821",
  "fullname" : "镇赉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220800",
  "id" : "220822",
  "fullname" : "通榆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220800",
  "id" : "220881",
  "fullname" : "洮南市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "220800",
  "id" : "220882",
  "fullname" : "大安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "222400",
  "id" : "222401",
  "fullname" : "延吉市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "222400",
  "id" : "222402",
  "fullname" : "图们市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "222400",
  "id" : "222403",
  "fullname" : "敦化市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "222400",
  "id" : "222404",
  "fullname" : "珲春市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "222400",
  "id" : "222405",
  "fullname" : "龙井市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "222400",
  "id" : "222406",
  "fullname" : "和龙市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "222400",
  "id" : "222424",
  "fullname" : "汪清县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "222400",
  "id" : "222426",
  "fullname" : "安图县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230102",
  "fullname" : "道里区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230103",
  "fullname" : "南岗区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230104",
  "fullname" : "道外区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230108",
  "fullname" : "平房区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230109",
  "fullname" : "松北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230110",
  "fullname" : "香坊区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230111",
  "fullname" : "呼兰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230112",
  "fullname" : "阿城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230113",
  "fullname" : "双城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230123",
  "fullname" : "依兰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230124",
  "fullname" : "方正县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230125",
  "fullname" : "宾县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230126",
  "fullname" : "巴彦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230127",
  "fullname" : "木兰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230128",
  "fullname" : "通河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230129",
  "fullname" : "延寿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230183",
  "fullname" : "尚志市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230100",
  "id" : "230184",
  "fullname" : "五常市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230202",
  "fullname" : "龙沙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230203",
  "fullname" : "建华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230204",
  "fullname" : "铁锋区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230205",
  "fullname" : "昂昂溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230206",
  "fullname" : "富拉尔基区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230207",
  "fullname" : "碾子山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230208",
  "fullname" : "梅里斯达斡尔族区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230221",
  "fullname" : "龙江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230223",
  "fullname" : "依安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230224",
  "fullname" : "泰来县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230225",
  "fullname" : "甘南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230227",
  "fullname" : "富裕县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230229",
  "fullname" : "克山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230230",
  "fullname" : "克东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230231",
  "fullname" : "拜泉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230200",
  "id" : "230281",
  "fullname" : "讷河市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230302",
  "fullname" : "鸡冠区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230303",
  "fullname" : "恒山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230304",
  "fullname" : "滴道区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230305",
  "fullname" : "梨树区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230306",
  "fullname" : "城子河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230307",
  "fullname" : "麻山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230321",
  "fullname" : "鸡东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230381",
  "fullname" : "虎林市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230300",
  "id" : "230382",
  "fullname" : "密山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230400",
  "id" : "230402",
  "fullname" : "向阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230400",
  "id" : "230403",
  "fullname" : "工农区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230400",
  "id" : "230404",
  "fullname" : "南山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230400",
  "id" : "230405",
  "fullname" : "兴安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230400",
  "id" : "230406",
  "fullname" : "东山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230400",
  "id" : "230407",
  "fullname" : "兴山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230400",
  "id" : "230421",
  "fullname" : "萝北县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230400",
  "id" : "230422",
  "fullname" : "绥滨县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230500",
  "id" : "230502",
  "fullname" : "尖山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230500",
  "id" : "230503",
  "fullname" : "岭东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230500",
  "id" : "230505",
  "fullname" : "四方台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230500",
  "id" : "230506",
  "fullname" : "宝山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230500",
  "id" : "230521",
  "fullname" : "集贤县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230500",
  "id" : "230522",
  "fullname" : "友谊县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230500",
  "id" : "230523",
  "fullname" : "宝清县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230500",
  "id" : "230524",
  "fullname" : "饶河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230602",
  "fullname" : "萨尔图区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230603",
  "fullname" : "龙凤区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230604",
  "fullname" : "让胡路区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230605",
  "fullname" : "红岗区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230606",
  "fullname" : "大同区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230621",
  "fullname" : "肇州县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230622",
  "fullname" : "肇源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230623",
  "fullname" : "林甸县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230600",
  "id" : "230624",
  "fullname" : "杜尔伯特蒙古族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230717",
  "fullname" : "伊美区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230718",
  "fullname" : "乌翠区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230719",
  "fullname" : "友好区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230722",
  "fullname" : "嘉荫县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230723",
  "fullname" : "汤旺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230724",
  "fullname" : "丰林县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230725",
  "fullname" : "大箐山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230726",
  "fullname" : "南岔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230751",
  "fullname" : "金林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230700",
  "id" : "230781",
  "fullname" : "铁力市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230803",
  "fullname" : "向阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230804",
  "fullname" : "前进区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230805",
  "fullname" : "东风区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230811",
  "fullname" : "郊区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230822",
  "fullname" : "桦南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230826",
  "fullname" : "桦川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230828",
  "fullname" : "汤原县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230881",
  "fullname" : "同江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230882",
  "fullname" : "富锦市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230800",
  "id" : "230883",
  "fullname" : "抚远市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230900",
  "id" : "230902",
  "fullname" : "新兴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230900",
  "id" : "230903",
  "fullname" : "桃山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230900",
  "id" : "230904",
  "fullname" : "茄子河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "230900",
  "id" : "230921",
  "fullname" : "勃利县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231002",
  "fullname" : "东安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231003",
  "fullname" : "阳明区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231004",
  "fullname" : "爱民区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231005",
  "fullname" : "西安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231025",
  "fullname" : "林口县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231081",
  "fullname" : "绥芬河市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231083",
  "fullname" : "海林市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231084",
  "fullname" : "宁安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231085",
  "fullname" : "穆棱市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231000",
  "id" : "231086",
  "fullname" : "东宁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231100",
  "id" : "231102",
  "fullname" : "爱辉区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231100",
  "id" : "231123",
  "fullname" : "逊克县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231100",
  "id" : "231124",
  "fullname" : "孙吴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231100",
  "id" : "231181",
  "fullname" : "北安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231100",
  "id" : "231182",
  "fullname" : "五大连池市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231100",
  "id" : "231183",
  "fullname" : "嫩江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231202",
  "fullname" : "北林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231221",
  "fullname" : "望奎县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231222",
  "fullname" : "兰西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231223",
  "fullname" : "青冈县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231224",
  "fullname" : "庆安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231225",
  "fullname" : "明水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231226",
  "fullname" : "绥棱县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231281",
  "fullname" : "安达市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231282",
  "fullname" : "肇东市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "231200",
  "id" : "231283",
  "fullname" : "海伦市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "232700",
  "id" : "232701",
  "fullname" : "漠河市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "232700",
  "id" : "232721",
  "fullname" : "呼玛县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "232700",
  "id" : "232722",
  "fullname" : "塔河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "232700",
  "id" : "232761",
  "fullname" : "加格达奇区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320102",
  "fullname" : "玄武区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320104",
  "fullname" : "秦淮区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320105",
  "fullname" : "建邺区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320106",
  "fullname" : "鼓楼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320111",
  "fullname" : "浦口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320113",
  "fullname" : "栖霞区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320114",
  "fullname" : "雨花台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320115",
  "fullname" : "江宁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320116",
  "fullname" : "六合区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320117",
  "fullname" : "溧水区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320100",
  "id" : "320118",
  "fullname" : "高淳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320200",
  "id" : "320205",
  "fullname" : "锡山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320200",
  "id" : "320206",
  "fullname" : "惠山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320200",
  "id" : "320211",
  "fullname" : "滨湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320200",
  "id" : "320213",
  "fullname" : "梁溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320200",
  "id" : "320214",
  "fullname" : "新吴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320200",
  "id" : "320281",
  "fullname" : "江阴市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320200",
  "id" : "320282",
  "fullname" : "宜兴市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320302",
  "fullname" : "鼓楼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320303",
  "fullname" : "云龙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320305",
  "fullname" : "贾汪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320311",
  "fullname" : "泉山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320312",
  "fullname" : "铜山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320321",
  "fullname" : "丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320322",
  "fullname" : "沛县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320324",
  "fullname" : "睢宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320381",
  "fullname" : "新沂市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320300",
  "id" : "320382",
  "fullname" : "邳州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320400",
  "id" : "320402",
  "fullname" : "天宁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320400",
  "id" : "320404",
  "fullname" : "钟楼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320400",
  "id" : "320411",
  "fullname" : "新北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320400",
  "id" : "320412",
  "fullname" : "武进区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320400",
  "id" : "320413",
  "fullname" : "金坛区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320400",
  "id" : "320481",
  "fullname" : "溧阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320505",
  "fullname" : "虎丘区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320506",
  "fullname" : "吴中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320507",
  "fullname" : "相城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320508",
  "fullname" : "姑苏区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320509",
  "fullname" : "吴江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320581",
  "fullname" : "常熟市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320582",
  "fullname" : "张家港市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320583",
  "fullname" : "昆山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320500",
  "id" : "320585",
  "fullname" : "太仓市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320600",
  "id" : "320602",
  "fullname" : "崇川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320600",
  "id" : "320612",
  "fullname" : "通州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320600",
  "id" : "320623",
  "fullname" : "如东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320600",
  "id" : "320681",
  "fullname" : "启东市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320600",
  "id" : "320682",
  "fullname" : "如皋市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320600",
  "id" : "320684",
  "fullname" : "海门区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320600",
  "id" : "320685",
  "fullname" : "海安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320700",
  "id" : "320703",
  "fullname" : "连云区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320700",
  "id" : "320706",
  "fullname" : "海州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320700",
  "id" : "320707",
  "fullname" : "赣榆区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320700",
  "id" : "320722",
  "fullname" : "东海县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320700",
  "id" : "320723",
  "fullname" : "灌云县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320700",
  "id" : "320724",
  "fullname" : "灌南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320800",
  "id" : "320803",
  "fullname" : "淮安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320800",
  "id" : "320804",
  "fullname" : "淮阴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320800",
  "id" : "320812",
  "fullname" : "清江浦区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320800",
  "id" : "320813",
  "fullname" : "洪泽区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320800",
  "id" : "320826",
  "fullname" : "涟水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320800",
  "id" : "320830",
  "fullname" : "盱眙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320800",
  "id" : "320831",
  "fullname" : "金湖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320902",
  "fullname" : "亭湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320903",
  "fullname" : "盐都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320904",
  "fullname" : "大丰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320921",
  "fullname" : "响水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320922",
  "fullname" : "滨海县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320923",
  "fullname" : "阜宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320924",
  "fullname" : "射阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320925",
  "fullname" : "建湖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "320900",
  "id" : "320981",
  "fullname" : "东台市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321000",
  "id" : "321002",
  "fullname" : "广陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321000",
  "id" : "321003",
  "fullname" : "邗江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321000",
  "id" : "321012",
  "fullname" : "江都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321000",
  "id" : "321023",
  "fullname" : "宝应县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321000",
  "id" : "321081",
  "fullname" : "仪征市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321000",
  "id" : "321084",
  "fullname" : "高邮市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321100",
  "id" : "321102",
  "fullname" : "京口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321100",
  "id" : "321111",
  "fullname" : "润州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321100",
  "id" : "321112",
  "fullname" : "丹徒区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321100",
  "id" : "321181",
  "fullname" : "丹阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321100",
  "id" : "321182",
  "fullname" : "扬中市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321100",
  "id" : "321183",
  "fullname" : "句容市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321200",
  "id" : "321202",
  "fullname" : "海陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321200",
  "id" : "321203",
  "fullname" : "高港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321200",
  "id" : "321204",
  "fullname" : "姜堰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321200",
  "id" : "321281",
  "fullname" : "兴化市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321200",
  "id" : "321282",
  "fullname" : "靖江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321200",
  "id" : "321283",
  "fullname" : "泰兴市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321300",
  "id" : "321302",
  "fullname" : "宿城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321300",
  "id" : "321311",
  "fullname" : "宿豫区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321300",
  "id" : "321322",
  "fullname" : "沭阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321300",
  "id" : "321323",
  "fullname" : "泗阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "321300",
  "id" : "321324",
  "fullname" : "泗洪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330102",
  "fullname" : "上城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330103",
  "fullname" : "下城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330104",
  "fullname" : "江干区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330105",
  "fullname" : "拱墅区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330106",
  "fullname" : "西湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330108",
  "fullname" : "滨江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330109",
  "fullname" : "萧山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330110",
  "fullname" : "余杭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330111",
  "fullname" : "富阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330112",
  "fullname" : "临安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330122",
  "fullname" : "桐庐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330127",
  "fullname" : "淳安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330100",
  "id" : "330182",
  "fullname" : "建德市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330203",
  "fullname" : "海曙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330205",
  "fullname" : "江北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330206",
  "fullname" : "北仑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330211",
  "fullname" : "镇海区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330212",
  "fullname" : "鄞州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330213",
  "fullname" : "奉化区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330225",
  "fullname" : "象山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330226",
  "fullname" : "宁海县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330281",
  "fullname" : "余姚市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330200",
  "id" : "330282",
  "fullname" : "慈溪市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330302",
  "fullname" : "鹿城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330303",
  "fullname" : "龙湾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330304",
  "fullname" : "瓯海区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330305",
  "fullname" : "洞头区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330324",
  "fullname" : "永嘉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330326",
  "fullname" : "平阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330327",
  "fullname" : "苍南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330328",
  "fullname" : "文成县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330329",
  "fullname" : "泰顺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330381",
  "fullname" : "瑞安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330382",
  "fullname" : "乐清市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330300",
  "id" : "330383",
  "fullname" : "龙港市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330400",
  "id" : "330402",
  "fullname" : "南湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330400",
  "id" : "330411",
  "fullname" : "秀洲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330400",
  "id" : "330421",
  "fullname" : "嘉善县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330400",
  "id" : "330424",
  "fullname" : "海盐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330400",
  "id" : "330481",
  "fullname" : "海宁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330400",
  "id" : "330482",
  "fullname" : "平湖市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330400",
  "id" : "330483",
  "fullname" : "桐乡市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330500",
  "id" : "330502",
  "fullname" : "吴兴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330500",
  "id" : "330503",
  "fullname" : "南浔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330500",
  "id" : "330521",
  "fullname" : "德清县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330500",
  "id" : "330522",
  "fullname" : "长兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330500",
  "id" : "330523",
  "fullname" : "安吉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330600",
  "id" : "330602",
  "fullname" : "越城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330600",
  "id" : "330603",
  "fullname" : "柯桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330600",
  "id" : "330604",
  "fullname" : "上虞区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330600",
  "id" : "330624",
  "fullname" : "新昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330600",
  "id" : "330681",
  "fullname" : "诸暨市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330600",
  "id" : "330683",
  "fullname" : "嵊州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330702",
  "fullname" : "婺城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330703",
  "fullname" : "金东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330723",
  "fullname" : "武义县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330726",
  "fullname" : "浦江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330727",
  "fullname" : "磐安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330781",
  "fullname" : "兰溪市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330782",
  "fullname" : "义乌市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330783",
  "fullname" : "东阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330700",
  "id" : "330784",
  "fullname" : "永康市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330800",
  "id" : "330802",
  "fullname" : "柯城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330800",
  "id" : "330803",
  "fullname" : "衢江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330800",
  "id" : "330822",
  "fullname" : "常山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330800",
  "id" : "330824",
  "fullname" : "开化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330800",
  "id" : "330825",
  "fullname" : "龙游县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330800",
  "id" : "330881",
  "fullname" : "江山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330900",
  "id" : "330902",
  "fullname" : "定海区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330900",
  "id" : "330903",
  "fullname" : "普陀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330900",
  "id" : "330921",
  "fullname" : "岱山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "330900",
  "id" : "330922",
  "fullname" : "嵊泗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331002",
  "fullname" : "椒江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331003",
  "fullname" : "黄岩区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331004",
  "fullname" : "路桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331022",
  "fullname" : "三门县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331023",
  "fullname" : "天台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331024",
  "fullname" : "仙居县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331081",
  "fullname" : "温岭市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331082",
  "fullname" : "临海市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331000",
  "id" : "331083",
  "fullname" : "玉环市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331102",
  "fullname" : "莲都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331121",
  "fullname" : "青田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331122",
  "fullname" : "缙云县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331123",
  "fullname" : "遂昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331124",
  "fullname" : "松阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331125",
  "fullname" : "云和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331126",
  "fullname" : "庆元县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331127",
  "fullname" : "景宁畲族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "331100",
  "id" : "331181",
  "fullname" : "龙泉市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340102",
  "fullname" : "瑶海区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340103",
  "fullname" : "庐阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340104",
  "fullname" : "蜀山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340111",
  "fullname" : "包河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340121",
  "fullname" : "长丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340122",
  "fullname" : "肥东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340123",
  "fullname" : "肥西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340124",
  "fullname" : "庐江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340100",
  "id" : "340181",
  "fullname" : "巢湖市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340200",
  "id" : "340202",
  "fullname" : "镜湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340200",
  "id" : "340203",
  "fullname" : "弋江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340200",
  "id" : "340207",
  "fullname" : "鸠江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340200",
  "id" : "340221",
  "fullname" : "湾沚区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340200",
  "id" : "340222",
  "fullname" : "繁昌区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340200",
  "id" : "340223",
  "fullname" : "南陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340200",
  "id" : "340281",
  "fullname" : "无为市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340300",
  "id" : "340302",
  "fullname" : "龙子湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340300",
  "id" : "340303",
  "fullname" : "蚌山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340300",
  "id" : "340304",
  "fullname" : "禹会区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340300",
  "id" : "340311",
  "fullname" : "淮上区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340300",
  "id" : "340321",
  "fullname" : "怀远县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340300",
  "id" : "340322",
  "fullname" : "五河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340300",
  "id" : "340323",
  "fullname" : "固镇县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340400",
  "id" : "340402",
  "fullname" : "大通区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340400",
  "id" : "340403",
  "fullname" : "田家庵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340400",
  "id" : "340404",
  "fullname" : "谢家集区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340400",
  "id" : "340405",
  "fullname" : "八公山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340400",
  "id" : "340406",
  "fullname" : "潘集区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340400",
  "id" : "340421",
  "fullname" : "凤台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340400",
  "id" : "340422",
  "fullname" : "寿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340500",
  "id" : "340503",
  "fullname" : "花山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340500",
  "id" : "340504",
  "fullname" : "雨山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340500",
  "id" : "340506",
  "fullname" : "博望区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340500",
  "id" : "340521",
  "fullname" : "当涂县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340500",
  "id" : "340522",
  "fullname" : "含山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340500",
  "id" : "340523",
  "fullname" : "和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340600",
  "id" : "340602",
  "fullname" : "杜集区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340600",
  "id" : "340603",
  "fullname" : "相山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340600",
  "id" : "340604",
  "fullname" : "烈山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340600",
  "id" : "340621",
  "fullname" : "濉溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340700",
  "id" : "340705",
  "fullname" : "铜官区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340700",
  "id" : "340706",
  "fullname" : "义安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340700",
  "id" : "340711",
  "fullname" : "郊区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340700",
  "id" : "340722",
  "fullname" : "枞阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340802",
  "fullname" : "迎江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340803",
  "fullname" : "大观区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340811",
  "fullname" : "宜秀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340822",
  "fullname" : "怀宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340825",
  "fullname" : "太湖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340826",
  "fullname" : "宿松县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340827",
  "fullname" : "望江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340828",
  "fullname" : "岳西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340881",
  "fullname" : "桐城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "340800",
  "id" : "340882",
  "fullname" : "潜山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341000",
  "id" : "341002",
  "fullname" : "屯溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341000",
  "id" : "341003",
  "fullname" : "黄山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341000",
  "id" : "341004",
  "fullname" : "徽州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341000",
  "id" : "341021",
  "fullname" : "歙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341000",
  "id" : "341022",
  "fullname" : "休宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341000",
  "id" : "341023",
  "fullname" : "黟县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341000",
  "id" : "341024",
  "fullname" : "祁门县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341100",
  "id" : "341102",
  "fullname" : "琅琊区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341100",
  "id" : "341103",
  "fullname" : "南谯区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341100",
  "id" : "341122",
  "fullname" : "来安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341100",
  "id" : "341124",
  "fullname" : "全椒县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341100",
  "id" : "341125",
  "fullname" : "定远县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341100",
  "id" : "341126",
  "fullname" : "凤阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341100",
  "id" : "341181",
  "fullname" : "天长市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341100",
  "id" : "341182",
  "fullname" : "明光市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341200",
  "id" : "341202",
  "fullname" : "颍州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341200",
  "id" : "341203",
  "fullname" : "颍东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341200",
  "id" : "341204",
  "fullname" : "颍泉区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341200",
  "id" : "341221",
  "fullname" : "临泉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341200",
  "id" : "341222",
  "fullname" : "太和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341200",
  "id" : "341225",
  "fullname" : "阜南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341200",
  "id" : "341226",
  "fullname" : "颍上县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341200",
  "id" : "341282",
  "fullname" : "界首市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341300",
  "id" : "341302",
  "fullname" : "埇桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341300",
  "id" : "341321",
  "fullname" : "砀山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341300",
  "id" : "341322",
  "fullname" : "萧县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341300",
  "id" : "341323",
  "fullname" : "灵璧县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341300",
  "id" : "341324",
  "fullname" : "泗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341500",
  "id" : "341502",
  "fullname" : "金安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341500",
  "id" : "341503",
  "fullname" : "裕安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341500",
  "id" : "341504",
  "fullname" : "叶集区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341500",
  "id" : "341522",
  "fullname" : "霍邱县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341500",
  "id" : "341523",
  "fullname" : "舒城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341500",
  "id" : "341524",
  "fullname" : "金寨县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341500",
  "id" : "341525",
  "fullname" : "霍山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341600",
  "id" : "341602",
  "fullname" : "谯城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341600",
  "id" : "341621",
  "fullname" : "涡阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341600",
  "id" : "341622",
  "fullname" : "蒙城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341600",
  "id" : "341623",
  "fullname" : "利辛县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341700",
  "id" : "341702",
  "fullname" : "贵池区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341700",
  "id" : "341721",
  "fullname" : "东至县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341700",
  "id" : "341722",
  "fullname" : "石台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341700",
  "id" : "341723",
  "fullname" : "青阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341800",
  "id" : "341802",
  "fullname" : "宣州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341800",
  "id" : "341821",
  "fullname" : "郎溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341800",
  "id" : "341823",
  "fullname" : "泾县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341800",
  "id" : "341824",
  "fullname" : "绩溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341800",
  "id" : "341825",
  "fullname" : "旌德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341800",
  "id" : "341881",
  "fullname" : "宁国市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "341800",
  "id" : "341882",
  "fullname" : "广德市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350102",
  "fullname" : "鼓楼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350103",
  "fullname" : "台江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350104",
  "fullname" : "仓山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350105",
  "fullname" : "马尾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350111",
  "fullname" : "晋安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350112",
  "fullname" : "长乐区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350121",
  "fullname" : "闽侯县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350122",
  "fullname" : "连江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350123",
  "fullname" : "罗源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350124",
  "fullname" : "闽清县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350125",
  "fullname" : "永泰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350128",
  "fullname" : "平潭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350100",
  "id" : "350181",
  "fullname" : "福清市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350200",
  "id" : "350203",
  "fullname" : "思明区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350200",
  "id" : "350205",
  "fullname" : "海沧区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350200",
  "id" : "350206",
  "fullname" : "湖里区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350200",
  "id" : "350211",
  "fullname" : "集美区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350200",
  "id" : "350212",
  "fullname" : "同安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350200",
  "id" : "350213",
  "fullname" : "翔安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350300",
  "id" : "350302",
  "fullname" : "城厢区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350300",
  "id" : "350303",
  "fullname" : "涵江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350300",
  "id" : "350304",
  "fullname" : "荔城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350300",
  "id" : "350305",
  "fullname" : "秀屿区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350300",
  "id" : "350322",
  "fullname" : "仙游县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350402",
  "fullname" : "梅列区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350403",
  "fullname" : "三元区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350421",
  "fullname" : "明溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350423",
  "fullname" : "清流县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350424",
  "fullname" : "宁化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350425",
  "fullname" : "大田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350426",
  "fullname" : "尤溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350427",
  "fullname" : "沙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350428",
  "fullname" : "将乐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350429",
  "fullname" : "泰宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350430",
  "fullname" : "建宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350400",
  "id" : "350481",
  "fullname" : "永安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350502",
  "fullname" : "鲤城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350503",
  "fullname" : "丰泽区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350504",
  "fullname" : "洛江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350505",
  "fullname" : "泉港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350521",
  "fullname" : "惠安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350524",
  "fullname" : "安溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350525",
  "fullname" : "永春县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350526",
  "fullname" : "德化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350527",
  "fullname" : "金门县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350581",
  "fullname" : "石狮市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350582",
  "fullname" : "晋江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350500",
  "id" : "350583",
  "fullname" : "南安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350602",
  "fullname" : "芗城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350603",
  "fullname" : "龙文区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350622",
  "fullname" : "云霄县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350623",
  "fullname" : "漳浦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350624",
  "fullname" : "诏安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350625",
  "fullname" : "长泰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350626",
  "fullname" : "东山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350627",
  "fullname" : "南靖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350628",
  "fullname" : "平和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350629",
  "fullname" : "华安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350600",
  "id" : "350681",
  "fullname" : "龙海市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350702",
  "fullname" : "延平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350703",
  "fullname" : "建阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350721",
  "fullname" : "顺昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350722",
  "fullname" : "浦城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350723",
  "fullname" : "光泽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350724",
  "fullname" : "松溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350725",
  "fullname" : "政和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350781",
  "fullname" : "邵武市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350782",
  "fullname" : "武夷山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350700",
  "id" : "350783",
  "fullname" : "建瓯市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350800",
  "id" : "350802",
  "fullname" : "新罗区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350800",
  "id" : "350803",
  "fullname" : "永定区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350800",
  "id" : "350821",
  "fullname" : "长汀县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350800",
  "id" : "350823",
  "fullname" : "上杭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350800",
  "id" : "350824",
  "fullname" : "武平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350800",
  "id" : "350825",
  "fullname" : "连城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350800",
  "id" : "350881",
  "fullname" : "漳平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350902",
  "fullname" : "蕉城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350921",
  "fullname" : "霞浦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350922",
  "fullname" : "古田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350923",
  "fullname" : "屏南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350924",
  "fullname" : "寿宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350925",
  "fullname" : "周宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350926",
  "fullname" : "柘荣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350981",
  "fullname" : "福安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "350900",
  "id" : "350982",
  "fullname" : "福鼎市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360102",
  "fullname" : "东湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360103",
  "fullname" : "西湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360104",
  "fullname" : "青云谱区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360111",
  "fullname" : "青山湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360112",
  "fullname" : "新建区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360113",
  "fullname" : "红谷滩区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360121",
  "fullname" : "南昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360123",
  "fullname" : "安义县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360100",
  "id" : "360124",
  "fullname" : "进贤县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360200",
  "id" : "360202",
  "fullname" : "昌江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360200",
  "id" : "360203",
  "fullname" : "珠山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360200",
  "id" : "360222",
  "fullname" : "浮梁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360200",
  "id" : "360281",
  "fullname" : "乐平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360300",
  "id" : "360302",
  "fullname" : "安源区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360300",
  "id" : "360313",
  "fullname" : "湘东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360300",
  "id" : "360321",
  "fullname" : "莲花县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360300",
  "id" : "360322",
  "fullname" : "上栗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360300",
  "id" : "360323",
  "fullname" : "芦溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360402",
  "fullname" : "濂溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360403",
  "fullname" : "浔阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360404",
  "fullname" : "柴桑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360423",
  "fullname" : "武宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360424",
  "fullname" : "修水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360425",
  "fullname" : "永修县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360426",
  "fullname" : "德安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360428",
  "fullname" : "都昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360429",
  "fullname" : "湖口县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360430",
  "fullname" : "彭泽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360481",
  "fullname" : "瑞昌市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360482",
  "fullname" : "共青城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360400",
  "id" : "360483",
  "fullname" : "庐山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360500",
  "id" : "360502",
  "fullname" : "渝水区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360500",
  "id" : "360521",
  "fullname" : "分宜县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360600",
  "id" : "360602",
  "fullname" : "月湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360600",
  "id" : "360603",
  "fullname" : "余江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360600",
  "id" : "360681",
  "fullname" : "贵溪市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360702",
  "fullname" : "章贡区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360703",
  "fullname" : "南康区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360704",
  "fullname" : "赣县区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360722",
  "fullname" : "信丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360723",
  "fullname" : "大余县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360724",
  "fullname" : "上犹县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360725",
  "fullname" : "崇义县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360726",
  "fullname" : "安远县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360728",
  "fullname" : "定南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360729",
  "fullname" : "全南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360730",
  "fullname" : "宁都县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360731",
  "fullname" : "于都县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360732",
  "fullname" : "兴国县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360733",
  "fullname" : "会昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360734",
  "fullname" : "寻乌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360735",
  "fullname" : "石城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360781",
  "fullname" : "瑞金市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360700",
  "id" : "360783",
  "fullname" : "龙南市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360802",
  "fullname" : "吉州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360803",
  "fullname" : "青原区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360821",
  "fullname" : "吉安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360822",
  "fullname" : "吉水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360823",
  "fullname" : "峡江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360824",
  "fullname" : "新干县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360825",
  "fullname" : "永丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360826",
  "fullname" : "泰和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360827",
  "fullname" : "遂川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360828",
  "fullname" : "万安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360829",
  "fullname" : "安福县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360830",
  "fullname" : "永新县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360800",
  "id" : "360881",
  "fullname" : "井冈山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360902",
  "fullname" : "袁州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360921",
  "fullname" : "奉新县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360922",
  "fullname" : "万载县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360923",
  "fullname" : "上高县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360924",
  "fullname" : "宜丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360925",
  "fullname" : "靖安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360926",
  "fullname" : "铜鼓县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360981",
  "fullname" : "丰城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360982",
  "fullname" : "樟树市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "360900",
  "id" : "360983",
  "fullname" : "高安市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361002",
  "fullname" : "临川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361003",
  "fullname" : "东乡区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361021",
  "fullname" : "南城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361022",
  "fullname" : "黎川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361023",
  "fullname" : "南丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361024",
  "fullname" : "崇仁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361025",
  "fullname" : "乐安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361026",
  "fullname" : "宜黄县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361027",
  "fullname" : "金溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361028",
  "fullname" : "资溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361000",
  "id" : "361030",
  "fullname" : "广昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361102",
  "fullname" : "信州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361103",
  "fullname" : "广丰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361104",
  "fullname" : "广信区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361123",
  "fullname" : "玉山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361124",
  "fullname" : "铅山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361125",
  "fullname" : "横峰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361126",
  "fullname" : "弋阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361127",
  "fullname" : "余干县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361128",
  "fullname" : "鄱阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361129",
  "fullname" : "万年县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361130",
  "fullname" : "婺源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "361100",
  "id" : "361181",
  "fullname" : "德兴市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370102",
  "fullname" : "历下区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370103",
  "fullname" : "市中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370104",
  "fullname" : "槐荫区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370105",
  "fullname" : "天桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370112",
  "fullname" : "历城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370113",
  "fullname" : "长清区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370114",
  "fullname" : "章丘区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370115",
  "fullname" : "济阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370116",
  "fullname" : "莱芜区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370117",
  "fullname" : "钢城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370124",
  "fullname" : "平阴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370100",
  "id" : "370126",
  "fullname" : "商河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370202",
  "fullname" : "市南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370203",
  "fullname" : "市北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370211",
  "fullname" : "黄岛区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370212",
  "fullname" : "崂山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370213",
  "fullname" : "李沧区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370214",
  "fullname" : "城阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370215",
  "fullname" : "即墨区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370281",
  "fullname" : "胶州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370283",
  "fullname" : "平度市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370200",
  "id" : "370285",
  "fullname" : "莱西市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370300",
  "id" : "370302",
  "fullname" : "淄川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370300",
  "id" : "370303",
  "fullname" : "张店区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370300",
  "id" : "370304",
  "fullname" : "博山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370300",
  "id" : "370305",
  "fullname" : "临淄区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370300",
  "id" : "370306",
  "fullname" : "周村区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370300",
  "id" : "370321",
  "fullname" : "桓台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370300",
  "id" : "370322",
  "fullname" : "高青县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370300",
  "id" : "370323",
  "fullname" : "沂源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370400",
  "id" : "370402",
  "fullname" : "市中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370400",
  "id" : "370403",
  "fullname" : "薛城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370400",
  "id" : "370404",
  "fullname" : "峄城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370400",
  "id" : "370405",
  "fullname" : "台儿庄区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370400",
  "id" : "370406",
  "fullname" : "山亭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370400",
  "id" : "370481",
  "fullname" : "滕州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370500",
  "id" : "370502",
  "fullname" : "东营区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370500",
  "id" : "370503",
  "fullname" : "河口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370500",
  "id" : "370505",
  "fullname" : "垦利区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370500",
  "id" : "370522",
  "fullname" : "利津县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370500",
  "id" : "370523",
  "fullname" : "广饶县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370602",
  "fullname" : "芝罘区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370611",
  "fullname" : "福山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370612",
  "fullname" : "牟平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370613",
  "fullname" : "莱山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370614",
  "fullname" : "蓬莱区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370681",
  "fullname" : "龙口市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370682",
  "fullname" : "莱阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370683",
  "fullname" : "莱州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370685",
  "fullname" : "招远市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370686",
  "fullname" : "栖霞市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370600",
  "id" : "370687",
  "fullname" : "海阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370702",
  "fullname" : "潍城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370703",
  "fullname" : "寒亭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370704",
  "fullname" : "坊子区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370705",
  "fullname" : "奎文区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370724",
  "fullname" : "临朐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370725",
  "fullname" : "昌乐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370781",
  "fullname" : "青州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370782",
  "fullname" : "诸城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370783",
  "fullname" : "寿光市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370784",
  "fullname" : "安丘市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370785",
  "fullname" : "高密市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370700",
  "id" : "370786",
  "fullname" : "昌邑市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370811",
  "fullname" : "任城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370812",
  "fullname" : "兖州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370826",
  "fullname" : "微山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370827",
  "fullname" : "鱼台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370828",
  "fullname" : "金乡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370829",
  "fullname" : "嘉祥县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370830",
  "fullname" : "汶上县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370831",
  "fullname" : "泗水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370832",
  "fullname" : "梁山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370881",
  "fullname" : "曲阜市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370800",
  "id" : "370883",
  "fullname" : "邹城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370900",
  "id" : "370902",
  "fullname" : "泰山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370900",
  "id" : "370911",
  "fullname" : "岱岳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370900",
  "id" : "370921",
  "fullname" : "宁阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370900",
  "id" : "370923",
  "fullname" : "东平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370900",
  "id" : "370982",
  "fullname" : "新泰市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "370900",
  "id" : "370983",
  "fullname" : "肥城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371000",
  "id" : "371002",
  "fullname" : "环翠区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371000",
  "id" : "371003",
  "fullname" : "文登区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371000",
  "id" : "371082",
  "fullname" : "荣成市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371000",
  "id" : "371083",
  "fullname" : "乳山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371100",
  "id" : "371102",
  "fullname" : "东港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371100",
  "id" : "371103",
  "fullname" : "岚山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371100",
  "id" : "371121",
  "fullname" : "五莲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371100",
  "id" : "371122",
  "fullname" : "莒县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371302",
  "fullname" : "兰山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371311",
  "fullname" : "罗庄区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371312",
  "fullname" : "河东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371321",
  "fullname" : "沂南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371322",
  "fullname" : "郯城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371323",
  "fullname" : "沂水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371324",
  "fullname" : "兰陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371325",
  "fullname" : "费县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371326",
  "fullname" : "平邑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371327",
  "fullname" : "莒南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371328",
  "fullname" : "蒙阴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371300",
  "id" : "371329",
  "fullname" : "临沭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371402",
  "fullname" : "德城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371403",
  "fullname" : "陵城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371422",
  "fullname" : "宁津县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371423",
  "fullname" : "庆云县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371424",
  "fullname" : "临邑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371425",
  "fullname" : "齐河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371426",
  "fullname" : "平原县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371427",
  "fullname" : "夏津县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371428",
  "fullname" : "武城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371481",
  "fullname" : "乐陵市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371400",
  "id" : "371482",
  "fullname" : "禹城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371500",
  "id" : "371502",
  "fullname" : "东昌府区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371500",
  "id" : "371503",
  "fullname" : "茌平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371500",
  "id" : "371521",
  "fullname" : "阳谷县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371500",
  "id" : "371522",
  "fullname" : "莘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371500",
  "id" : "371524",
  "fullname" : "东阿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371500",
  "id" : "371525",
  "fullname" : "冠县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371500",
  "id" : "371526",
  "fullname" : "高唐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371500",
  "id" : "371581",
  "fullname" : "临清市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371600",
  "id" : "371602",
  "fullname" : "滨城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371600",
  "id" : "371603",
  "fullname" : "沾化区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371600",
  "id" : "371621",
  "fullname" : "惠民县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371600",
  "id" : "371622",
  "fullname" : "阳信县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371600",
  "id" : "371623",
  "fullname" : "无棣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371600",
  "id" : "371625",
  "fullname" : "博兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371600",
  "id" : "371681",
  "fullname" : "邹平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371702",
  "fullname" : "牡丹区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371703",
  "fullname" : "定陶区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371721",
  "fullname" : "曹县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371722",
  "fullname" : "单县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371723",
  "fullname" : "成武县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371724",
  "fullname" : "巨野县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371725",
  "fullname" : "郓城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371726",
  "fullname" : "鄄城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "371700",
  "id" : "371728",
  "fullname" : "东明县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410102",
  "fullname" : "中原区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410103",
  "fullname" : "二七区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410104",
  "fullname" : "管城回族区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410105",
  "fullname" : "金水区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410106",
  "fullname" : "上街区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410108",
  "fullname" : "惠济区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410122",
  "fullname" : "中牟县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410181",
  "fullname" : "巩义市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410182",
  "fullname" : "荥阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410183",
  "fullname" : "新密市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410184",
  "fullname" : "新郑市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410100",
  "id" : "410185",
  "fullname" : "登封市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410202",
  "fullname" : "龙亭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410203",
  "fullname" : "顺河回族区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410204",
  "fullname" : "鼓楼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410205",
  "fullname" : "禹王台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410212",
  "fullname" : "祥符区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410221",
  "fullname" : "杞县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410222",
  "fullname" : "通许县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410223",
  "fullname" : "尉氏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410200",
  "id" : "410225",
  "fullname" : "兰考县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410302",
  "fullname" : "老城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410303",
  "fullname" : "西工区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410304",
  "fullname" : "瀍河回族区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410305",
  "fullname" : "涧西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410306",
  "fullname" : "吉利区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410311",
  "fullname" : "洛龙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410322",
  "fullname" : "孟津县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410323",
  "fullname" : "新安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410324",
  "fullname" : "栾川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410325",
  "fullname" : "嵩县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410326",
  "fullname" : "汝阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410327",
  "fullname" : "宜阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410328",
  "fullname" : "洛宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410329",
  "fullname" : "伊川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410300",
  "id" : "410381",
  "fullname" : "偃师市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410402",
  "fullname" : "新华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410403",
  "fullname" : "卫东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410404",
  "fullname" : "石龙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410411",
  "fullname" : "湛河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410421",
  "fullname" : "宝丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410422",
  "fullname" : "叶县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410423",
  "fullname" : "鲁山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410425",
  "fullname" : "郏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410481",
  "fullname" : "舞钢市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410400",
  "id" : "410482",
  "fullname" : "汝州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410502",
  "fullname" : "文峰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410503",
  "fullname" : "北关区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410505",
  "fullname" : "殷都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410506",
  "fullname" : "龙安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410522",
  "fullname" : "安阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410523",
  "fullname" : "汤阴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410526",
  "fullname" : "滑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410527",
  "fullname" : "内黄县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410500",
  "id" : "410581",
  "fullname" : "林州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410600",
  "id" : "410602",
  "fullname" : "鹤山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410600",
  "id" : "410603",
  "fullname" : "山城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410600",
  "id" : "410611",
  "fullname" : "淇滨区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410600",
  "id" : "410621",
  "fullname" : "浚县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410600",
  "id" : "410622",
  "fullname" : "淇县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410702",
  "fullname" : "红旗区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410703",
  "fullname" : "卫滨区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410704",
  "fullname" : "凤泉区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410711",
  "fullname" : "牧野区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410721",
  "fullname" : "新乡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410724",
  "fullname" : "获嘉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410725",
  "fullname" : "原阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410726",
  "fullname" : "延津县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410727",
  "fullname" : "封丘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410781",
  "fullname" : "卫辉市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410782",
  "fullname" : "辉县市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410700",
  "id" : "410783",
  "fullname" : "长垣市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410802",
  "fullname" : "解放区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410803",
  "fullname" : "中站区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410804",
  "fullname" : "马村区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410811",
  "fullname" : "山阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410821",
  "fullname" : "修武县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410822",
  "fullname" : "博爱县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410823",
  "fullname" : "武陟县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410825",
  "fullname" : "温县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410882",
  "fullname" : "沁阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410800",
  "id" : "410883",
  "fullname" : "孟州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410900",
  "id" : "410902",
  "fullname" : "华龙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410900",
  "id" : "410922",
  "fullname" : "清丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410900",
  "id" : "410923",
  "fullname" : "南乐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410900",
  "id" : "410926",
  "fullname" : "范县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410900",
  "id" : "410927",
  "fullname" : "台前县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "410900",
  "id" : "410928",
  "fullname" : "濮阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411000",
  "id" : "411002",
  "fullname" : "魏都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411000",
  "id" : "411003",
  "fullname" : "建安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411000",
  "id" : "411024",
  "fullname" : "鄢陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411000",
  "id" : "411025",
  "fullname" : "襄城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411000",
  "id" : "411081",
  "fullname" : "禹州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411000",
  "id" : "411082",
  "fullname" : "长葛市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411100",
  "id" : "411102",
  "fullname" : "源汇区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411100",
  "id" : "411103",
  "fullname" : "郾城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411100",
  "id" : "411104",
  "fullname" : "召陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411100",
  "id" : "411121",
  "fullname" : "舞阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411100",
  "id" : "411122",
  "fullname" : "临颍县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411200",
  "id" : "411202",
  "fullname" : "湖滨区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411200",
  "id" : "411203",
  "fullname" : "陕州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411200",
  "id" : "411221",
  "fullname" : "渑池县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411200",
  "id" : "411224",
  "fullname" : "卢氏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411200",
  "id" : "411281",
  "fullname" : "义马市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411200",
  "id" : "411282",
  "fullname" : "灵宝市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411302",
  "fullname" : "宛城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411303",
  "fullname" : "卧龙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411321",
  "fullname" : "南召县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411322",
  "fullname" : "方城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411323",
  "fullname" : "西峡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411324",
  "fullname" : "镇平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411325",
  "fullname" : "内乡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411326",
  "fullname" : "淅川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411327",
  "fullname" : "社旗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411328",
  "fullname" : "唐河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411329",
  "fullname" : "新野县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411330",
  "fullname" : "桐柏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411300",
  "id" : "411381",
  "fullname" : "邓州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411402",
  "fullname" : "梁园区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411403",
  "fullname" : "睢阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411421",
  "fullname" : "民权县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411422",
  "fullname" : "睢县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411423",
  "fullname" : "宁陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411424",
  "fullname" : "柘城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411425",
  "fullname" : "虞城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411426",
  "fullname" : "夏邑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411400",
  "id" : "411481",
  "fullname" : "永城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411502",
  "fullname" : "浉河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411503",
  "fullname" : "平桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411521",
  "fullname" : "罗山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411522",
  "fullname" : "光山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411523",
  "fullname" : "新县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411524",
  "fullname" : "商城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411525",
  "fullname" : "固始县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411526",
  "fullname" : "潢川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411527",
  "fullname" : "淮滨县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411500",
  "id" : "411528",
  "fullname" : "息县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411602",
  "fullname" : "川汇区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411603",
  "fullname" : "淮阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411621",
  "fullname" : "扶沟县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411622",
  "fullname" : "西华县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411623",
  "fullname" : "商水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411624",
  "fullname" : "沈丘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411625",
  "fullname" : "郸城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411627",
  "fullname" : "太康县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411628",
  "fullname" : "鹿邑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411600",
  "id" : "411681",
  "fullname" : "项城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411702",
  "fullname" : "驿城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411721",
  "fullname" : "西平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411722",
  "fullname" : "上蔡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411723",
  "fullname" : "平舆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411724",
  "fullname" : "正阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411725",
  "fullname" : "确山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411726",
  "fullname" : "泌阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411727",
  "fullname" : "汝南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411728",
  "fullname" : "遂平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "411700",
  "id" : "411729",
  "fullname" : "新蔡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420102",
  "fullname" : "江岸区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420103",
  "fullname" : "江汉区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420104",
  "fullname" : "硚口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420105",
  "fullname" : "汉阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420106",
  "fullname" : "武昌区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420107",
  "fullname" : "青山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420111",
  "fullname" : "洪山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420112",
  "fullname" : "东西湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420113",
  "fullname" : "汉南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420114",
  "fullname" : "蔡甸区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420115",
  "fullname" : "江夏区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420116",
  "fullname" : "黄陂区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420100",
  "id" : "420117",
  "fullname" : "新洲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420200",
  "id" : "420202",
  "fullname" : "黄石港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420200",
  "id" : "420203",
  "fullname" : "西塞山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420200",
  "id" : "420204",
  "fullname" : "下陆区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420200",
  "id" : "420205",
  "fullname" : "铁山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420200",
  "id" : "420222",
  "fullname" : "阳新县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420200",
  "id" : "420281",
  "fullname" : "大冶市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420300",
  "id" : "420302",
  "fullname" : "茅箭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420300",
  "id" : "420303",
  "fullname" : "张湾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420300",
  "id" : "420304",
  "fullname" : "郧阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420300",
  "id" : "420322",
  "fullname" : "郧西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420300",
  "id" : "420323",
  "fullname" : "竹山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420300",
  "id" : "420324",
  "fullname" : "竹溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420300",
  "id" : "420325",
  "fullname" : "房县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420300",
  "id" : "420381",
  "fullname" : "丹江口市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420502",
  "fullname" : "西陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420503",
  "fullname" : "伍家岗区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420504",
  "fullname" : "点军区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420505",
  "fullname" : "猇亭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420506",
  "fullname" : "夷陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420525",
  "fullname" : "远安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420526",
  "fullname" : "兴山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420527",
  "fullname" : "秭归县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420528",
  "fullname" : "长阳土家族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420529",
  "fullname" : "五峰土家族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420581",
  "fullname" : "宜都市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420582",
  "fullname" : "当阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420500",
  "id" : "420583",
  "fullname" : "枝江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420602",
  "fullname" : "襄城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420606",
  "fullname" : "樊城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420607",
  "fullname" : "襄州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420624",
  "fullname" : "南漳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420625",
  "fullname" : "谷城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420626",
  "fullname" : "保康县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420682",
  "fullname" : "老河口市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420683",
  "fullname" : "枣阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420600",
  "id" : "420684",
  "fullname" : "宜城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420700",
  "id" : "420702",
  "fullname" : "梁子湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420700",
  "id" : "420703",
  "fullname" : "华容区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420700",
  "id" : "420704",
  "fullname" : "鄂城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420800",
  "id" : "420802",
  "fullname" : "东宝区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420800",
  "id" : "420804",
  "fullname" : "掇刀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420800",
  "id" : "420822",
  "fullname" : "沙洋县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420800",
  "id" : "420881",
  "fullname" : "钟祥市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420800",
  "id" : "420882",
  "fullname" : "京山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420900",
  "id" : "420902",
  "fullname" : "孝南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420900",
  "id" : "420921",
  "fullname" : "孝昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420900",
  "id" : "420922",
  "fullname" : "大悟县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420900",
  "id" : "420923",
  "fullname" : "云梦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420900",
  "id" : "420981",
  "fullname" : "应城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420900",
  "id" : "420982",
  "fullname" : "安陆市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "420900",
  "id" : "420984",
  "fullname" : "汉川市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421000",
  "id" : "421002",
  "fullname" : "沙市区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421000",
  "id" : "421003",
  "fullname" : "荆州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421000",
  "id" : "421022",
  "fullname" : "公安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421000",
  "id" : "421023",
  "fullname" : "监利市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421000",
  "id" : "421024",
  "fullname" : "江陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421000",
  "id" : "421081",
  "fullname" : "石首市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421000",
  "id" : "421083",
  "fullname" : "洪湖市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421000",
  "id" : "421087",
  "fullname" : "松滋市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421102",
  "fullname" : "黄州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421121",
  "fullname" : "团风县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421122",
  "fullname" : "红安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421123",
  "fullname" : "罗田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421124",
  "fullname" : "英山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421125",
  "fullname" : "浠水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421126",
  "fullname" : "蕲春县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421127",
  "fullname" : "黄梅县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421181",
  "fullname" : "麻城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421100",
  "id" : "421182",
  "fullname" : "武穴市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421200",
  "id" : "421202",
  "fullname" : "咸安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421200",
  "id" : "421221",
  "fullname" : "嘉鱼县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421200",
  "id" : "421222",
  "fullname" : "通城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421200",
  "id" : "421223",
  "fullname" : "崇阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421200",
  "id" : "421224",
  "fullname" : "通山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421200",
  "id" : "421281",
  "fullname" : "赤壁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421300",
  "id" : "421303",
  "fullname" : "曾都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421300",
  "id" : "421321",
  "fullname" : "随县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "421300",
  "id" : "421381",
  "fullname" : "广水市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "422800",
  "id" : "422801",
  "fullname" : "恩施市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "422800",
  "id" : "422802",
  "fullname" : "利川市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "422800",
  "id" : "422822",
  "fullname" : "建始县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "422800",
  "id" : "422823",
  "fullname" : "巴东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "422800",
  "id" : "422825",
  "fullname" : "宣恩县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "422800",
  "id" : "422826",
  "fullname" : "咸丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "422800",
  "id" : "422827",
  "fullname" : "来凤县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "422800",
  "id" : "422828",
  "fullname" : "鹤峰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430102",
  "fullname" : "芙蓉区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430103",
  "fullname" : "天心区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430104",
  "fullname" : "岳麓区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430105",
  "fullname" : "开福区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430111",
  "fullname" : "雨花区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430112",
  "fullname" : "望城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430121",
  "fullname" : "长沙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430181",
  "fullname" : "浏阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430100",
  "id" : "430182",
  "fullname" : "宁乡市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430202",
  "fullname" : "荷塘区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430203",
  "fullname" : "芦淞区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430204",
  "fullname" : "石峰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430211",
  "fullname" : "天元区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430212",
  "fullname" : "渌口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430223",
  "fullname" : "攸县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430224",
  "fullname" : "茶陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430225",
  "fullname" : "炎陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430200",
  "id" : "430281",
  "fullname" : "醴陵市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430300",
  "id" : "430302",
  "fullname" : "雨湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430300",
  "id" : "430304",
  "fullname" : "岳塘区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430300",
  "id" : "430321",
  "fullname" : "湘潭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430300",
  "id" : "430381",
  "fullname" : "湘乡市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430300",
  "id" : "430382",
  "fullname" : "韶山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430405",
  "fullname" : "珠晖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430406",
  "fullname" : "雁峰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430407",
  "fullname" : "石鼓区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430408",
  "fullname" : "蒸湘区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430412",
  "fullname" : "南岳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430421",
  "fullname" : "衡阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430422",
  "fullname" : "衡南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430423",
  "fullname" : "衡山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430424",
  "fullname" : "衡东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430426",
  "fullname" : "祁东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430481",
  "fullname" : "耒阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430400",
  "id" : "430482",
  "fullname" : "常宁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430502",
  "fullname" : "双清区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430503",
  "fullname" : "大祥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430511",
  "fullname" : "北塔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430522",
  "fullname" : "新邵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430523",
  "fullname" : "邵阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430524",
  "fullname" : "隆回县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430525",
  "fullname" : "洞口县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430527",
  "fullname" : "绥宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430528",
  "fullname" : "新宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430529",
  "fullname" : "城步苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430581",
  "fullname" : "武冈市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430500",
  "id" : "430582",
  "fullname" : "邵东市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430602",
  "fullname" : "岳阳楼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430603",
  "fullname" : "云溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430611",
  "fullname" : "君山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430621",
  "fullname" : "岳阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430623",
  "fullname" : "华容县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430624",
  "fullname" : "湘阴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430626",
  "fullname" : "平江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430681",
  "fullname" : "汨罗市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430600",
  "id" : "430682",
  "fullname" : "临湘市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430702",
  "fullname" : "武陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430703",
  "fullname" : "鼎城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430721",
  "fullname" : "安乡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430722",
  "fullname" : "汉寿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430723",
  "fullname" : "澧县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430724",
  "fullname" : "临澧县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430725",
  "fullname" : "桃源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430726",
  "fullname" : "石门县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430700",
  "id" : "430781",
  "fullname" : "津市市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430800",
  "id" : "430802",
  "fullname" : "永定区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430800",
  "id" : "430811",
  "fullname" : "武陵源区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430800",
  "id" : "430821",
  "fullname" : "慈利县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430800",
  "id" : "430822",
  "fullname" : "桑植县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430900",
  "id" : "430902",
  "fullname" : "资阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430900",
  "id" : "430903",
  "fullname" : "赫山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430900",
  "id" : "430921",
  "fullname" : "南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430900",
  "id" : "430922",
  "fullname" : "桃江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430900",
  "id" : "430923",
  "fullname" : "安化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "430900",
  "id" : "430981",
  "fullname" : "沅江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431002",
  "fullname" : "北湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431003",
  "fullname" : "苏仙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431021",
  "fullname" : "桂阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431022",
  "fullname" : "宜章县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431023",
  "fullname" : "永兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431024",
  "fullname" : "嘉禾县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431025",
  "fullname" : "临武县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431026",
  "fullname" : "汝城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431027",
  "fullname" : "桂东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431028",
  "fullname" : "安仁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431000",
  "id" : "431081",
  "fullname" : "资兴市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431102",
  "fullname" : "零陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431103",
  "fullname" : "冷水滩区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431121",
  "fullname" : "祁阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431122",
  "fullname" : "东安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431123",
  "fullname" : "双牌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431124",
  "fullname" : "道县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431125",
  "fullname" : "江永县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431126",
  "fullname" : "宁远县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431127",
  "fullname" : "蓝山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431128",
  "fullname" : "新田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431100",
  "id" : "431129",
  "fullname" : "江华瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431202",
  "fullname" : "鹤城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431221",
  "fullname" : "中方县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431222",
  "fullname" : "沅陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431223",
  "fullname" : "辰溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431224",
  "fullname" : "溆浦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431225",
  "fullname" : "会同县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431226",
  "fullname" : "麻阳苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431227",
  "fullname" : "新晃侗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431228",
  "fullname" : "芷江侗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431229",
  "fullname" : "靖州苗族侗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431230",
  "fullname" : "通道侗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431200",
  "id" : "431281",
  "fullname" : "洪江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431300",
  "id" : "431302",
  "fullname" : "娄星区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431300",
  "id" : "431321",
  "fullname" : "双峰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431300",
  "id" : "431322",
  "fullname" : "新化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431300",
  "id" : "431381",
  "fullname" : "冷水江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "431300",
  "id" : "431382",
  "fullname" : "涟源市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "433100",
  "id" : "433101",
  "fullname" : "吉首市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "433100",
  "id" : "433122",
  "fullname" : "泸溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "433100",
  "id" : "433123",
  "fullname" : "凤凰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "433100",
  "id" : "433124",
  "fullname" : "花垣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "433100",
  "id" : "433125",
  "fullname" : "保靖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "433100",
  "id" : "433126",
  "fullname" : "古丈县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "433100",
  "id" : "433127",
  "fullname" : "永顺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "433100",
  "id" : "433130",
  "fullname" : "龙山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440103",
  "fullname" : "荔湾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440104",
  "fullname" : "越秀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440105",
  "fullname" : "海珠区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440106",
  "fullname" : "天河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440111",
  "fullname" : "白云区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440112",
  "fullname" : "黄埔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440113",
  "fullname" : "番禺区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440114",
  "fullname" : "花都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440115",
  "fullname" : "南沙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440117",
  "fullname" : "从化区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440100",
  "id" : "440118",
  "fullname" : "增城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440203",
  "fullname" : "武江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440204",
  "fullname" : "浈江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440205",
  "fullname" : "曲江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440222",
  "fullname" : "始兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440224",
  "fullname" : "仁化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440229",
  "fullname" : "翁源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440232",
  "fullname" : "乳源瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440233",
  "fullname" : "新丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440281",
  "fullname" : "乐昌市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440200",
  "id" : "440282",
  "fullname" : "南雄市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440303",
  "fullname" : "罗湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440304",
  "fullname" : "福田区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440305",
  "fullname" : "南山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440306",
  "fullname" : "宝安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440307",
  "fullname" : "龙岗区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440308",
  "fullname" : "盐田区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440309",
  "fullname" : "龙华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440310",
  "fullname" : "坪山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440300",
  "id" : "440311",
  "fullname" : "光明区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440400",
  "id" : "440402",
  "fullname" : "香洲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440400",
  "id" : "440403",
  "fullname" : "斗门区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440400",
  "id" : "440404",
  "fullname" : "金湾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440400",
  "id" : "440499",
  "fullname" : "香洲区澳门大学横琴校区(由澳门特别行政区实施管辖)"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440500",
  "id" : "440507",
  "fullname" : "龙湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440500",
  "id" : "440511",
  "fullname" : "金平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440500",
  "id" : "440512",
  "fullname" : "濠江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440500",
  "id" : "440513",
  "fullname" : "潮阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440500",
  "id" : "440514",
  "fullname" : "潮南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440500",
  "id" : "440515",
  "fullname" : "澄海区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440500",
  "id" : "440523",
  "fullname" : "南澳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440600",
  "id" : "440604",
  "fullname" : "禅城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440600",
  "id" : "440605",
  "fullname" : "南海区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440600",
  "id" : "440606",
  "fullname" : "顺德区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440600",
  "id" : "440607",
  "fullname" : "三水区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440600",
  "id" : "440608",
  "fullname" : "高明区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440700",
  "id" : "440703",
  "fullname" : "蓬江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440700",
  "id" : "440704",
  "fullname" : "江海区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440700",
  "id" : "440705",
  "fullname" : "新会区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440700",
  "id" : "440781",
  "fullname" : "台山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440700",
  "id" : "440783",
  "fullname" : "开平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440700",
  "id" : "440784",
  "fullname" : "鹤山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440700",
  "id" : "440785",
  "fullname" : "恩平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440802",
  "fullname" : "赤坎区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440803",
  "fullname" : "霞山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440804",
  "fullname" : "坡头区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440811",
  "fullname" : "麻章区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440823",
  "fullname" : "遂溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440825",
  "fullname" : "徐闻县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440881",
  "fullname" : "廉江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440882",
  "fullname" : "雷州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440800",
  "id" : "440883",
  "fullname" : "吴川市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440900",
  "id" : "440902",
  "fullname" : "茂南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440900",
  "id" : "440904",
  "fullname" : "电白区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440900",
  "id" : "440981",
  "fullname" : "高州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440900",
  "id" : "440982",
  "fullname" : "化州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "440900",
  "id" : "440983",
  "fullname" : "信宜市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441200",
  "id" : "441202",
  "fullname" : "端州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441200",
  "id" : "441203",
  "fullname" : "鼎湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441200",
  "id" : "441204",
  "fullname" : "高要区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441200",
  "id" : "441223",
  "fullname" : "广宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441200",
  "id" : "441224",
  "fullname" : "怀集县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441200",
  "id" : "441225",
  "fullname" : "封开县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441200",
  "id" : "441226",
  "fullname" : "德庆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441200",
  "id" : "441284",
  "fullname" : "四会市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441300",
  "id" : "441302",
  "fullname" : "惠城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441300",
  "id" : "441303",
  "fullname" : "惠阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441300",
  "id" : "441322",
  "fullname" : "博罗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441300",
  "id" : "441323",
  "fullname" : "惠东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441300",
  "id" : "441324",
  "fullname" : "龙门县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441400",
  "id" : "441402",
  "fullname" : "梅江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441400",
  "id" : "441403",
  "fullname" : "梅县区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441400",
  "id" : "441422",
  "fullname" : "大埔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441400",
  "id" : "441423",
  "fullname" : "丰顺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441400",
  "id" : "441424",
  "fullname" : "五华县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441400",
  "id" : "441426",
  "fullname" : "平远县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441400",
  "id" : "441427",
  "fullname" : "蕉岭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441400",
  "id" : "441481",
  "fullname" : "兴宁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441500",
  "id" : "441502",
  "fullname" : "城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441500",
  "id" : "441521",
  "fullname" : "海丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441500",
  "id" : "441523",
  "fullname" : "陆河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441500",
  "id" : "441581",
  "fullname" : "陆丰市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441600",
  "id" : "441602",
  "fullname" : "源城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441600",
  "id" : "441621",
  "fullname" : "紫金县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441600",
  "id" : "441622",
  "fullname" : "龙川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441600",
  "id" : "441623",
  "fullname" : "连平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441600",
  "id" : "441624",
  "fullname" : "和平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441600",
  "id" : "441625",
  "fullname" : "东源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441700",
  "id" : "441702",
  "fullname" : "江城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441700",
  "id" : "441704",
  "fullname" : "阳东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441700",
  "id" : "441721",
  "fullname" : "阳西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441700",
  "id" : "441781",
  "fullname" : "阳春市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441800",
  "id" : "441802",
  "fullname" : "清城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441800",
  "id" : "441803",
  "fullname" : "清新区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441800",
  "id" : "441821",
  "fullname" : "佛冈县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441800",
  "id" : "441823",
  "fullname" : "阳山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441800",
  "id" : "441825",
  "fullname" : "连山壮族瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441800",
  "id" : "441826",
  "fullname" : "连南瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441800",
  "id" : "441881",
  "fullname" : "英德市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441800",
  "id" : "441882",
  "fullname" : "连州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "441900",
  "id" : "441999",
  "fullname" : "东莞市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "442000",
  "id" : "442099",
  "fullname" : "中山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445100",
  "id" : "445102",
  "fullname" : "湘桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445100",
  "id" : "445103",
  "fullname" : "潮安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445100",
  "id" : "445122",
  "fullname" : "饶平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445200",
  "id" : "445202",
  "fullname" : "榕城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445200",
  "id" : "445203",
  "fullname" : "揭东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445200",
  "id" : "445222",
  "fullname" : "揭西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445200",
  "id" : "445224",
  "fullname" : "惠来县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445200",
  "id" : "445281",
  "fullname" : "普宁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445300",
  "id" : "445302",
  "fullname" : "云城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445300",
  "id" : "445303",
  "fullname" : "云安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445300",
  "id" : "445321",
  "fullname" : "新兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445300",
  "id" : "445322",
  "fullname" : "郁南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "445300",
  "id" : "445381",
  "fullname" : "罗定市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450102",
  "fullname" : "兴宁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450103",
  "fullname" : "青秀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450105",
  "fullname" : "江南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450107",
  "fullname" : "西乡塘区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450108",
  "fullname" : "良庆区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450109",
  "fullname" : "邕宁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450110",
  "fullname" : "武鸣区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450123",
  "fullname" : "隆安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450124",
  "fullname" : "马山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450125",
  "fullname" : "上林县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450126",
  "fullname" : "宾阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450100",
  "id" : "450127",
  "fullname" : "横县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450202",
  "fullname" : "城中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450203",
  "fullname" : "鱼峰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450204",
  "fullname" : "柳南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450205",
  "fullname" : "柳北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450206",
  "fullname" : "柳江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450222",
  "fullname" : "柳城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450223",
  "fullname" : "鹿寨县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450224",
  "fullname" : "融安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450225",
  "fullname" : "融水苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450200",
  "id" : "450226",
  "fullname" : "三江侗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450302",
  "fullname" : "秀峰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450303",
  "fullname" : "叠彩区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450304",
  "fullname" : "象山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450305",
  "fullname" : "七星区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450311",
  "fullname" : "雁山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450312",
  "fullname" : "临桂区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450321",
  "fullname" : "阳朔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450323",
  "fullname" : "灵川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450324",
  "fullname" : "全州县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450325",
  "fullname" : "兴安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450326",
  "fullname" : "永福县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450327",
  "fullname" : "灌阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450328",
  "fullname" : "龙胜各族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450329",
  "fullname" : "资源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450330",
  "fullname" : "平乐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450332",
  "fullname" : "恭城瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450300",
  "id" : "450381",
  "fullname" : "荔浦市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450400",
  "id" : "450403",
  "fullname" : "万秀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450400",
  "id" : "450405",
  "fullname" : "长洲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450400",
  "id" : "450406",
  "fullname" : "龙圩区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450400",
  "id" : "450421",
  "fullname" : "苍梧县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450400",
  "id" : "450422",
  "fullname" : "藤县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450400",
  "id" : "450423",
  "fullname" : "蒙山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450400",
  "id" : "450481",
  "fullname" : "岑溪市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450500",
  "id" : "450502",
  "fullname" : "海城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450500",
  "id" : "450503",
  "fullname" : "银海区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450500",
  "id" : "450512",
  "fullname" : "铁山港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450500",
  "id" : "450521",
  "fullname" : "合浦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450600",
  "id" : "450602",
  "fullname" : "港口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450600",
  "id" : "450603",
  "fullname" : "防城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450600",
  "id" : "450621",
  "fullname" : "上思县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450600",
  "id" : "450681",
  "fullname" : "东兴市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450700",
  "id" : "450702",
  "fullname" : "钦南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450700",
  "id" : "450703",
  "fullname" : "钦北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450700",
  "id" : "450721",
  "fullname" : "灵山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450700",
  "id" : "450722",
  "fullname" : "浦北县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450800",
  "id" : "450802",
  "fullname" : "港北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450800",
  "id" : "450803",
  "fullname" : "港南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450800",
  "id" : "450804",
  "fullname" : "覃塘区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450800",
  "id" : "450821",
  "fullname" : "平南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450800",
  "id" : "450881",
  "fullname" : "桂平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450900",
  "id" : "450902",
  "fullname" : "玉州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450900",
  "id" : "450903",
  "fullname" : "福绵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450900",
  "id" : "450921",
  "fullname" : "容县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450900",
  "id" : "450922",
  "fullname" : "陆川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450900",
  "id" : "450923",
  "fullname" : "博白县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450900",
  "id" : "450924",
  "fullname" : "兴业县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "450900",
  "id" : "450981",
  "fullname" : "北流市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451002",
  "fullname" : "右江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451003",
  "fullname" : "田阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451022",
  "fullname" : "田东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451024",
  "fullname" : "德保县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451026",
  "fullname" : "那坡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451027",
  "fullname" : "凌云县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451028",
  "fullname" : "乐业县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451029",
  "fullname" : "田林县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451030",
  "fullname" : "西林县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451031",
  "fullname" : "隆林各族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451081",
  "fullname" : "靖西市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451000",
  "id" : "451082",
  "fullname" : "平果市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451100",
  "id" : "451102",
  "fullname" : "八步区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451100",
  "id" : "451103",
  "fullname" : "平桂区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451100",
  "id" : "451121",
  "fullname" : "昭平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451100",
  "id" : "451122",
  "fullname" : "钟山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451100",
  "id" : "451123",
  "fullname" : "富川瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451202",
  "fullname" : "金城江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451203",
  "fullname" : "宜州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451221",
  "fullname" : "南丹县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451222",
  "fullname" : "天峨县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451223",
  "fullname" : "凤山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451224",
  "fullname" : "东兰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451225",
  "fullname" : "罗城仫佬族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451226",
  "fullname" : "环江毛南族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451227",
  "fullname" : "巴马瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451228",
  "fullname" : "都安瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451200",
  "id" : "451229",
  "fullname" : "大化瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451300",
  "id" : "451302",
  "fullname" : "兴宾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451300",
  "id" : "451321",
  "fullname" : "忻城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451300",
  "id" : "451322",
  "fullname" : "象州县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451300",
  "id" : "451323",
  "fullname" : "武宣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451300",
  "id" : "451324",
  "fullname" : "金秀瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451300",
  "id" : "451381",
  "fullname" : "合山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451400",
  "id" : "451402",
  "fullname" : "江州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451400",
  "id" : "451421",
  "fullname" : "扶绥县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451400",
  "id" : "451422",
  "fullname" : "宁明县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451400",
  "id" : "451423",
  "fullname" : "龙州县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451400",
  "id" : "451424",
  "fullname" : "大新县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451400",
  "id" : "451425",
  "fullname" : "天等县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "451400",
  "id" : "451481",
  "fullname" : "凭祥市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460100",
  "id" : "460105",
  "fullname" : "秀英区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460100",
  "id" : "460106",
  "fullname" : "龙华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460100",
  "id" : "460107",
  "fullname" : "琼山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460100",
  "id" : "460108",
  "fullname" : "美兰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460200",
  "id" : "460202",
  "fullname" : "海棠区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460200",
  "id" : "460203",
  "fullname" : "吉阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460200",
  "id" : "460204",
  "fullname" : "天涯区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460200",
  "id" : "460205",
  "fullname" : "崖州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460300",
  "id" : "460321",
  "fullname" : "西沙群岛"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460300",
  "id" : "460322",
  "fullname" : "南沙群岛"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460300",
  "id" : "460323",
  "fullname" : "中沙群岛的岛礁及其海域"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "460400",
  "id" : "460499",
  "fullname" : "儋州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510104",
  "fullname" : "锦江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510105",
  "fullname" : "青羊区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510106",
  "fullname" : "金牛区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510107",
  "fullname" : "武侯区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510108",
  "fullname" : "成华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510112",
  "fullname" : "龙泉驿区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510113",
  "fullname" : "青白江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510114",
  "fullname" : "新都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510115",
  "fullname" : "温江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510116",
  "fullname" : "双流区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510117",
  "fullname" : "郫都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510118",
  "fullname" : "新津区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510121",
  "fullname" : "金堂县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510129",
  "fullname" : "大邑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510131",
  "fullname" : "蒲江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510181",
  "fullname" : "都江堰市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510182",
  "fullname" : "彭州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510183",
  "fullname" : "邛崃市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510184",
  "fullname" : "崇州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510100",
  "id" : "510185",
  "fullname" : "简阳市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510300",
  "id" : "510302",
  "fullname" : "自流井区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510300",
  "id" : "510303",
  "fullname" : "贡井区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510300",
  "id" : "510304",
  "fullname" : "大安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510300",
  "id" : "510311",
  "fullname" : "沿滩区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510300",
  "id" : "510321",
  "fullname" : "荣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510300",
  "id" : "510322",
  "fullname" : "富顺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510400",
  "id" : "510402",
  "fullname" : "东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510400",
  "id" : "510403",
  "fullname" : "西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510400",
  "id" : "510411",
  "fullname" : "仁和区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510400",
  "id" : "510421",
  "fullname" : "米易县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510400",
  "id" : "510422",
  "fullname" : "盐边县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510500",
  "id" : "510502",
  "fullname" : "江阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510500",
  "id" : "510503",
  "fullname" : "纳溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510500",
  "id" : "510504",
  "fullname" : "龙马潭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510500",
  "id" : "510521",
  "fullname" : "泸县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510500",
  "id" : "510522",
  "fullname" : "合江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510500",
  "id" : "510524",
  "fullname" : "叙永县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510500",
  "id" : "510525",
  "fullname" : "古蔺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510600",
  "id" : "510603",
  "fullname" : "旌阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510600",
  "id" : "510604",
  "fullname" : "罗江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510600",
  "id" : "510623",
  "fullname" : "中江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510600",
  "id" : "510681",
  "fullname" : "广汉市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510600",
  "id" : "510682",
  "fullname" : "什邡市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510600",
  "id" : "510683",
  "fullname" : "绵竹市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510703",
  "fullname" : "涪城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510704",
  "fullname" : "游仙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510705",
  "fullname" : "安州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510722",
  "fullname" : "三台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510723",
  "fullname" : "盐亭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510725",
  "fullname" : "梓潼县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510726",
  "fullname" : "北川羌族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510727",
  "fullname" : "平武县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510700",
  "id" : "510781",
  "fullname" : "江油市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510800",
  "id" : "510802",
  "fullname" : "利州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510800",
  "id" : "510811",
  "fullname" : "昭化区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510800",
  "id" : "510812",
  "fullname" : "朝天区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510800",
  "id" : "510821",
  "fullname" : "旺苍县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510800",
  "id" : "510822",
  "fullname" : "青川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510800",
  "id" : "510823",
  "fullname" : "剑阁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510800",
  "id" : "510824",
  "fullname" : "苍溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510900",
  "id" : "510903",
  "fullname" : "船山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510900",
  "id" : "510904",
  "fullname" : "安居区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510900",
  "id" : "510921",
  "fullname" : "蓬溪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510900",
  "id" : "510923",
  "fullname" : "大英县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "510900",
  "id" : "510981",
  "fullname" : "射洪市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511000",
  "id" : "511002",
  "fullname" : "市中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511000",
  "id" : "511011",
  "fullname" : "东兴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511000",
  "id" : "511024",
  "fullname" : "威远县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511000",
  "id" : "511025",
  "fullname" : "资中县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511000",
  "id" : "511083",
  "fullname" : "隆昌市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511102",
  "fullname" : "市中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511111",
  "fullname" : "沙湾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511112",
  "fullname" : "五通桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511113",
  "fullname" : "金口河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511123",
  "fullname" : "犍为县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511124",
  "fullname" : "井研县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511126",
  "fullname" : "夹江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511129",
  "fullname" : "沐川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511132",
  "fullname" : "峨边彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511133",
  "fullname" : "马边彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511100",
  "id" : "511181",
  "fullname" : "峨眉山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511302",
  "fullname" : "顺庆区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511303",
  "fullname" : "高坪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511304",
  "fullname" : "嘉陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511321",
  "fullname" : "南部县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511322",
  "fullname" : "营山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511323",
  "fullname" : "蓬安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511324",
  "fullname" : "仪陇县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511325",
  "fullname" : "西充县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511300",
  "id" : "511381",
  "fullname" : "阆中市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511400",
  "id" : "511402",
  "fullname" : "东坡区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511400",
  "id" : "511403",
  "fullname" : "彭山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511400",
  "id" : "511421",
  "fullname" : "仁寿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511400",
  "id" : "511423",
  "fullname" : "洪雅县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511400",
  "id" : "511424",
  "fullname" : "丹棱县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511400",
  "id" : "511425",
  "fullname" : "青神县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511502",
  "fullname" : "翠屏区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511503",
  "fullname" : "南溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511504",
  "fullname" : "叙州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511523",
  "fullname" : "江安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511524",
  "fullname" : "长宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511525",
  "fullname" : "高县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511526",
  "fullname" : "珙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511527",
  "fullname" : "筠连县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511528",
  "fullname" : "兴文县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511500",
  "id" : "511529",
  "fullname" : "屏山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511600",
  "id" : "511602",
  "fullname" : "广安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511600",
  "id" : "511603",
  "fullname" : "前锋区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511600",
  "id" : "511621",
  "fullname" : "岳池县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511600",
  "id" : "511622",
  "fullname" : "武胜县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511600",
  "id" : "511623",
  "fullname" : "邻水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511600",
  "id" : "511681",
  "fullname" : "华蓥市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511700",
  "id" : "511702",
  "fullname" : "通川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511700",
  "id" : "511703",
  "fullname" : "达川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511700",
  "id" : "511722",
  "fullname" : "宣汉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511700",
  "id" : "511723",
  "fullname" : "开江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511700",
  "id" : "511724",
  "fullname" : "大竹县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511700",
  "id" : "511725",
  "fullname" : "渠县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511700",
  "id" : "511781",
  "fullname" : "万源市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511800",
  "id" : "511802",
  "fullname" : "雨城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511800",
  "id" : "511803",
  "fullname" : "名山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511800",
  "id" : "511822",
  "fullname" : "荥经县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511800",
  "id" : "511823",
  "fullname" : "汉源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511800",
  "id" : "511824",
  "fullname" : "石棉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511800",
  "id" : "511825",
  "fullname" : "天全县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511800",
  "id" : "511826",
  "fullname" : "芦山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511800",
  "id" : "511827",
  "fullname" : "宝兴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511900",
  "id" : "511902",
  "fullname" : "巴州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511900",
  "id" : "511903",
  "fullname" : "恩阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511900",
  "id" : "511921",
  "fullname" : "通江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511900",
  "id" : "511922",
  "fullname" : "南江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "511900",
  "id" : "511923",
  "fullname" : "平昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "512000",
  "id" : "512002",
  "fullname" : "雁江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "512000",
  "id" : "512021",
  "fullname" : "安岳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "512000",
  "id" : "512022",
  "fullname" : "乐至县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513201",
  "fullname" : "马尔康市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513221",
  "fullname" : "汶川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513222",
  "fullname" : "理县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513223",
  "fullname" : "茂县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513224",
  "fullname" : "松潘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513225",
  "fullname" : "九寨沟县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513226",
  "fullname" : "金川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513227",
  "fullname" : "小金县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513228",
  "fullname" : "黑水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513230",
  "fullname" : "壤塘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513231",
  "fullname" : "阿坝县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513232",
  "fullname" : "若尔盖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513200",
  "id" : "513233",
  "fullname" : "红原县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513301",
  "fullname" : "康定市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513322",
  "fullname" : "泸定县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513323",
  "fullname" : "丹巴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513324",
  "fullname" : "九龙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513325",
  "fullname" : "雅江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513326",
  "fullname" : "道孚县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513327",
  "fullname" : "炉霍县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513328",
  "fullname" : "甘孜县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513329",
  "fullname" : "新龙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513330",
  "fullname" : "德格县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513331",
  "fullname" : "白玉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513332",
  "fullname" : "石渠县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513333",
  "fullname" : "色达县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513334",
  "fullname" : "理塘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513335",
  "fullname" : "巴塘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513336",
  "fullname" : "乡城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513337",
  "fullname" : "稻城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513300",
  "id" : "513338",
  "fullname" : "得荣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513401",
  "fullname" : "西昌市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513422",
  "fullname" : "木里藏族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513423",
  "fullname" : "盐源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513424",
  "fullname" : "德昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513425",
  "fullname" : "会理县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513426",
  "fullname" : "会东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513427",
  "fullname" : "宁南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513428",
  "fullname" : "普格县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513429",
  "fullname" : "布拖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513430",
  "fullname" : "金阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513431",
  "fullname" : "昭觉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513432",
  "fullname" : "喜德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513433",
  "fullname" : "冕宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513434",
  "fullname" : "越西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513435",
  "fullname" : "甘洛县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513436",
  "fullname" : "美姑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "513400",
  "id" : "513437",
  "fullname" : "雷波县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520102",
  "fullname" : "南明区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520103",
  "fullname" : "云岩区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520111",
  "fullname" : "花溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520112",
  "fullname" : "乌当区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520113",
  "fullname" : "白云区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520115",
  "fullname" : "观山湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520121",
  "fullname" : "开阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520122",
  "fullname" : "息烽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520123",
  "fullname" : "修文县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520100",
  "id" : "520181",
  "fullname" : "清镇市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520200",
  "id" : "520201",
  "fullname" : "钟山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520200",
  "id" : "520203",
  "fullname" : "六枝特区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520200",
  "id" : "520221",
  "fullname" : "水城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520200",
  "id" : "520281",
  "fullname" : "盘州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520302",
  "fullname" : "红花岗区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520303",
  "fullname" : "汇川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520304",
  "fullname" : "播州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520322",
  "fullname" : "桐梓县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520323",
  "fullname" : "绥阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520324",
  "fullname" : "正安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520325",
  "fullname" : "道真仡佬族苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520326",
  "fullname" : "务川仡佬族苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520327",
  "fullname" : "凤冈县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520328",
  "fullname" : "湄潭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520329",
  "fullname" : "余庆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520330",
  "fullname" : "习水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520381",
  "fullname" : "赤水市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520300",
  "id" : "520382",
  "fullname" : "仁怀市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520400",
  "id" : "520402",
  "fullname" : "西秀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520400",
  "id" : "520403",
  "fullname" : "平坝区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520400",
  "id" : "520422",
  "fullname" : "普定县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520400",
  "id" : "520423",
  "fullname" : "镇宁布依族苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520400",
  "id" : "520424",
  "fullname" : "关岭布依族苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520400",
  "id" : "520425",
  "fullname" : "紫云苗族布依族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520500",
  "id" : "520502",
  "fullname" : "七星关区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520500",
  "id" : "520521",
  "fullname" : "大方县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520500",
  "id" : "520522",
  "fullname" : "黔西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520500",
  "id" : "520523",
  "fullname" : "金沙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520500",
  "id" : "520524",
  "fullname" : "织金县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520500",
  "id" : "520525",
  "fullname" : "纳雍县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520500",
  "id" : "520526",
  "fullname" : "威宁彝族回族苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520500",
  "id" : "520527",
  "fullname" : "赫章县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520602",
  "fullname" : "碧江区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520603",
  "fullname" : "万山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520621",
  "fullname" : "江口县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520622",
  "fullname" : "玉屏侗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520623",
  "fullname" : "石阡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520624",
  "fullname" : "思南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520625",
  "fullname" : "印江土家族苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520626",
  "fullname" : "德江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520627",
  "fullname" : "沿河土家族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "520600",
  "id" : "520628",
  "fullname" : "松桃苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522300",
  "id" : "522301",
  "fullname" : "兴义市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522300",
  "id" : "522302",
  "fullname" : "兴仁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522300",
  "id" : "522323",
  "fullname" : "普安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522300",
  "id" : "522324",
  "fullname" : "晴隆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522300",
  "id" : "522325",
  "fullname" : "贞丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522300",
  "id" : "522326",
  "fullname" : "望谟县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522300",
  "id" : "522327",
  "fullname" : "册亨县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522300",
  "id" : "522328",
  "fullname" : "安龙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522601",
  "fullname" : "凯里市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522622",
  "fullname" : "黄平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522623",
  "fullname" : "施秉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522624",
  "fullname" : "三穗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522625",
  "fullname" : "镇远县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522626",
  "fullname" : "岑巩县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522627",
  "fullname" : "天柱县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522628",
  "fullname" : "锦屏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522629",
  "fullname" : "剑河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522630",
  "fullname" : "台江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522631",
  "fullname" : "黎平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522632",
  "fullname" : "榕江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522633",
  "fullname" : "从江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522634",
  "fullname" : "雷山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522635",
  "fullname" : "麻江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522600",
  "id" : "522636",
  "fullname" : "丹寨县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522701",
  "fullname" : "都匀市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522702",
  "fullname" : "福泉市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522722",
  "fullname" : "荔波县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522723",
  "fullname" : "贵定县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522725",
  "fullname" : "瓮安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522726",
  "fullname" : "独山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522727",
  "fullname" : "平塘县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522728",
  "fullname" : "罗甸县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522729",
  "fullname" : "长顺县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522730",
  "fullname" : "龙里县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522731",
  "fullname" : "惠水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "522700",
  "id" : "522732",
  "fullname" : "三都水族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530102",
  "fullname" : "五华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530103",
  "fullname" : "盘龙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530111",
  "fullname" : "官渡区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530112",
  "fullname" : "西山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530113",
  "fullname" : "东川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530114",
  "fullname" : "呈贡区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530115",
  "fullname" : "晋宁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530124",
  "fullname" : "富民县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530125",
  "fullname" : "宜良县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530126",
  "fullname" : "石林彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530127",
  "fullname" : "嵩明县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530128",
  "fullname" : "禄劝彝族苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530129",
  "fullname" : "寻甸回族彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530100",
  "id" : "530181",
  "fullname" : "安宁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530302",
  "fullname" : "麒麟区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530303",
  "fullname" : "沾益区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530304",
  "fullname" : "马龙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530322",
  "fullname" : "陆良县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530323",
  "fullname" : "师宗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530324",
  "fullname" : "罗平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530325",
  "fullname" : "富源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530326",
  "fullname" : "会泽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530300",
  "id" : "530381",
  "fullname" : "宣威市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530402",
  "fullname" : "红塔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530403",
  "fullname" : "江川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530423",
  "fullname" : "通海县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530424",
  "fullname" : "华宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530425",
  "fullname" : "易门县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530426",
  "fullname" : "峨山彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530427",
  "fullname" : "新平彝族傣族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530428",
  "fullname" : "元江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530400",
  "id" : "530481",
  "fullname" : "澄江市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530500",
  "id" : "530502",
  "fullname" : "隆阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530500",
  "id" : "530521",
  "fullname" : "施甸县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530500",
  "id" : "530523",
  "fullname" : "龙陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530500",
  "id" : "530524",
  "fullname" : "昌宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530500",
  "id" : "530581",
  "fullname" : "腾冲市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530602",
  "fullname" : "昭阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530621",
  "fullname" : "鲁甸县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530622",
  "fullname" : "巧家县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530623",
  "fullname" : "盐津县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530624",
  "fullname" : "大关县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530625",
  "fullname" : "永善县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530626",
  "fullname" : "绥江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530627",
  "fullname" : "镇雄县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530628",
  "fullname" : "彝良县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530629",
  "fullname" : "威信县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530600",
  "id" : "530681",
  "fullname" : "水富市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530700",
  "id" : "530702",
  "fullname" : "古城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530700",
  "id" : "530721",
  "fullname" : "玉龙纳西族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530700",
  "id" : "530722",
  "fullname" : "永胜县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530700",
  "id" : "530723",
  "fullname" : "华坪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530700",
  "id" : "530724",
  "fullname" : "宁蒗彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530802",
  "fullname" : "思茅区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530821",
  "fullname" : "宁洱哈尼族彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530822",
  "fullname" : "墨江哈尼族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530823",
  "fullname" : "景东彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530824",
  "fullname" : "景谷傣族彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530825",
  "fullname" : "镇沅县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530826",
  "fullname" : "江城哈尼族彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530827",
  "fullname" : "孟连县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530828",
  "fullname" : "澜沧拉祜族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530800",
  "id" : "530829",
  "fullname" : "西盟佤族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530900",
  "id" : "530902",
  "fullname" : "临翔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530900",
  "id" : "530921",
  "fullname" : "凤庆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530900",
  "id" : "530922",
  "fullname" : "云县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530900",
  "id" : "530923",
  "fullname" : "永德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530900",
  "id" : "530924",
  "fullname" : "镇康县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530900",
  "id" : "530925",
  "fullname" : "双江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530900",
  "id" : "530926",
  "fullname" : "耿马傣族佤族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "530900",
  "id" : "530927",
  "fullname" : "沧源佤族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532301",
  "fullname" : "楚雄市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532322",
  "fullname" : "双柏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532323",
  "fullname" : "牟定县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532324",
  "fullname" : "南华县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532325",
  "fullname" : "姚安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532326",
  "fullname" : "大姚县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532327",
  "fullname" : "永仁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532328",
  "fullname" : "元谋县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532329",
  "fullname" : "武定县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532300",
  "id" : "532331",
  "fullname" : "禄丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532501",
  "fullname" : "个旧市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532502",
  "fullname" : "开远市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532503",
  "fullname" : "蒙自市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532504",
  "fullname" : "弥勒市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532523",
  "fullname" : "屏边苗族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532524",
  "fullname" : "建水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532525",
  "fullname" : "石屏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532527",
  "fullname" : "泸西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532528",
  "fullname" : "元阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532529",
  "fullname" : "红河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532530",
  "fullname" : "金平苗族瑶族傣族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532531",
  "fullname" : "绿春县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532500",
  "id" : "532532",
  "fullname" : "河口瑶族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532600",
  "id" : "532601",
  "fullname" : "文山市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532600",
  "id" : "532622",
  "fullname" : "砚山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532600",
  "id" : "532623",
  "fullname" : "西畴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532600",
  "id" : "532624",
  "fullname" : "麻栗坡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532600",
  "id" : "532625",
  "fullname" : "马关县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532600",
  "id" : "532626",
  "fullname" : "丘北县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532600",
  "id" : "532627",
  "fullname" : "广南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532600",
  "id" : "532628",
  "fullname" : "富宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532800",
  "id" : "532801",
  "fullname" : "景洪市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532800",
  "id" : "532822",
  "fullname" : "勐海县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532800",
  "id" : "532823",
  "fullname" : "勐腊县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532901",
  "fullname" : "大理市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532922",
  "fullname" : "漾濞彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532923",
  "fullname" : "祥云县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532924",
  "fullname" : "宾川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532925",
  "fullname" : "弥渡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532926",
  "fullname" : "南涧彝族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532927",
  "fullname" : "巍山彝族回族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532928",
  "fullname" : "永平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532929",
  "fullname" : "云龙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532930",
  "fullname" : "洱源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532931",
  "fullname" : "剑川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "532900",
  "id" : "532932",
  "fullname" : "鹤庆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533100",
  "id" : "533102",
  "fullname" : "瑞丽市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533100",
  "id" : "533103",
  "fullname" : "芒市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533100",
  "id" : "533122",
  "fullname" : "梁河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533100",
  "id" : "533123",
  "fullname" : "盈江县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533100",
  "id" : "533124",
  "fullname" : "陇川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533300",
  "id" : "533301",
  "fullname" : "泸水市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533300",
  "id" : "533323",
  "fullname" : "福贡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533300",
  "id" : "533324",
  "fullname" : "贡山独龙族怒族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533300",
  "id" : "533325",
  "fullname" : "兰坪白族普米族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533400",
  "id" : "533401",
  "fullname" : "香格里拉市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533400",
  "id" : "533422",
  "fullname" : "德钦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "533400",
  "id" : "533423",
  "fullname" : "维西傈僳族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540100",
  "id" : "540102",
  "fullname" : "城关区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540100",
  "id" : "540103",
  "fullname" : "堆龙德庆区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540100",
  "id" : "540104",
  "fullname" : "达孜区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540100",
  "id" : "540121",
  "fullname" : "林周县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540100",
  "id" : "540122",
  "fullname" : "当雄县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540100",
  "id" : "540123",
  "fullname" : "尼木县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540100",
  "id" : "540124",
  "fullname" : "曲水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540100",
  "id" : "540127",
  "fullname" : "墨竹工卡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540202",
  "fullname" : "桑珠孜区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540221",
  "fullname" : "南木林县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540222",
  "fullname" : "江孜县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540223",
  "fullname" : "定日县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540224",
  "fullname" : "萨迦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540225",
  "fullname" : "拉孜县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540226",
  "fullname" : "昂仁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540227",
  "fullname" : "谢通门县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540228",
  "fullname" : "白朗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540229",
  "fullname" : "仁布县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540230",
  "fullname" : "康马县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540231",
  "fullname" : "定结县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540232",
  "fullname" : "仲巴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540233",
  "fullname" : "亚东县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540234",
  "fullname" : "吉隆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540235",
  "fullname" : "聂拉木县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540236",
  "fullname" : "萨嘎县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540200",
  "id" : "540237",
  "fullname" : "岗巴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540302",
  "fullname" : "卡若区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540321",
  "fullname" : "江达县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540322",
  "fullname" : "贡觉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540323",
  "fullname" : "类乌齐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540324",
  "fullname" : "丁青县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540325",
  "fullname" : "察雅县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540326",
  "fullname" : "八宿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540327",
  "fullname" : "左贡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540328",
  "fullname" : "芒康县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540329",
  "fullname" : "洛隆县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540300",
  "id" : "540330",
  "fullname" : "边坝县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540400",
  "id" : "540402",
  "fullname" : "巴宜区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540400",
  "id" : "540421",
  "fullname" : "工布江达县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540400",
  "id" : "540422",
  "fullname" : "米林县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540400",
  "id" : "540423",
  "fullname" : "墨脱县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540400",
  "id" : "540424",
  "fullname" : "波密县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540400",
  "id" : "540425",
  "fullname" : "察隅县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540400",
  "id" : "540426",
  "fullname" : "朗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540502",
  "fullname" : "乃东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540521",
  "fullname" : "扎囊县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540522",
  "fullname" : "贡嘎县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540523",
  "fullname" : "桑日县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540524",
  "fullname" : "琼结县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540525",
  "fullname" : "曲松县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540526",
  "fullname" : "措美县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540527",
  "fullname" : "洛扎县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540528",
  "fullname" : "加查县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540529",
  "fullname" : "隆子县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540530",
  "fullname" : "错那县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540500",
  "id" : "540531",
  "fullname" : "浪卡子县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540602",
  "fullname" : "色尼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540621",
  "fullname" : "嘉黎县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540622",
  "fullname" : "比如县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540623",
  "fullname" : "聂荣县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540624",
  "fullname" : "安多县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540625",
  "fullname" : "申扎县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540626",
  "fullname" : "索县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540627",
  "fullname" : "班戈县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540628",
  "fullname" : "巴青县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540629",
  "fullname" : "尼玛县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "540600",
  "id" : "540630",
  "fullname" : "双湖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "542500",
  "id" : "542521",
  "fullname" : "普兰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "542500",
  "id" : "542522",
  "fullname" : "札达县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "542500",
  "id" : "542523",
  "fullname" : "噶尔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "542500",
  "id" : "542524",
  "fullname" : "日土县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "542500",
  "id" : "542525",
  "fullname" : "革吉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "542500",
  "id" : "542526",
  "fullname" : "改则县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "542500",
  "id" : "542527",
  "fullname" : "措勤县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610102",
  "fullname" : "新城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610103",
  "fullname" : "碑林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610104",
  "fullname" : "莲湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610111",
  "fullname" : "灞桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610112",
  "fullname" : "未央区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610113",
  "fullname" : "雁塔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610114",
  "fullname" : "阎良区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610115",
  "fullname" : "临潼区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610116",
  "fullname" : "长安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610117",
  "fullname" : "高陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610118",
  "fullname" : "鄠邑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610122",
  "fullname" : "蓝田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610100",
  "id" : "610124",
  "fullname" : "周至县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610200",
  "id" : "610202",
  "fullname" : "王益区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610200",
  "id" : "610203",
  "fullname" : "印台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610200",
  "id" : "610204",
  "fullname" : "耀州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610200",
  "id" : "610222",
  "fullname" : "宜君县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610302",
  "fullname" : "渭滨区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610303",
  "fullname" : "金台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610304",
  "fullname" : "陈仓区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610322",
  "fullname" : "凤翔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610323",
  "fullname" : "岐山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610324",
  "fullname" : "扶风县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610326",
  "fullname" : "眉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610327",
  "fullname" : "陇县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610328",
  "fullname" : "千阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610329",
  "fullname" : "麟游县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610330",
  "fullname" : "凤县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610300",
  "id" : "610331",
  "fullname" : "太白县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610402",
  "fullname" : "秦都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610403",
  "fullname" : "杨陵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610404",
  "fullname" : "渭城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610422",
  "fullname" : "三原县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610423",
  "fullname" : "泾阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610424",
  "fullname" : "乾县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610425",
  "fullname" : "礼泉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610426",
  "fullname" : "永寿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610428",
  "fullname" : "长武县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610429",
  "fullname" : "旬邑县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610430",
  "fullname" : "淳化县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610431",
  "fullname" : "武功县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610481",
  "fullname" : "兴平市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610400",
  "id" : "610482",
  "fullname" : "彬州市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610502",
  "fullname" : "临渭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610503",
  "fullname" : "华州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610522",
  "fullname" : "潼关县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610523",
  "fullname" : "大荔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610524",
  "fullname" : "合阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610525",
  "fullname" : "澄城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610526",
  "fullname" : "蒲城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610527",
  "fullname" : "白水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610528",
  "fullname" : "富平县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610581",
  "fullname" : "韩城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610500",
  "id" : "610582",
  "fullname" : "华阴市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610602",
  "fullname" : "宝塔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610603",
  "fullname" : "安塞区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610621",
  "fullname" : "延长县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610622",
  "fullname" : "延川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610625",
  "fullname" : "志丹县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610626",
  "fullname" : "吴起县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610627",
  "fullname" : "甘泉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610628",
  "fullname" : "富县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610629",
  "fullname" : "洛川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610630",
  "fullname" : "宜川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610631",
  "fullname" : "黄龙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610632",
  "fullname" : "黄陵县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610600",
  "id" : "610681",
  "fullname" : "子长市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610702",
  "fullname" : "汉台区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610703",
  "fullname" : "南郑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610722",
  "fullname" : "城固县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610723",
  "fullname" : "洋县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610724",
  "fullname" : "西乡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610725",
  "fullname" : "勉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610726",
  "fullname" : "宁强县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610727",
  "fullname" : "略阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610728",
  "fullname" : "镇巴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610729",
  "fullname" : "留坝县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610700",
  "id" : "610730",
  "fullname" : "佛坪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610802",
  "fullname" : "榆阳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610803",
  "fullname" : "横山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610822",
  "fullname" : "府谷县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610824",
  "fullname" : "靖边县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610825",
  "fullname" : "定边县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610826",
  "fullname" : "绥德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610827",
  "fullname" : "米脂县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610828",
  "fullname" : "佳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610829",
  "fullname" : "吴堡县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610830",
  "fullname" : "清涧县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610831",
  "fullname" : "子洲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610800",
  "id" : "610881",
  "fullname" : "神木市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610902",
  "fullname" : "汉滨区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610921",
  "fullname" : "汉阴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610922",
  "fullname" : "石泉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610923",
  "fullname" : "宁陕县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610924",
  "fullname" : "紫阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610925",
  "fullname" : "岚皋县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610926",
  "fullname" : "平利县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610927",
  "fullname" : "镇坪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610928",
  "fullname" : "旬阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "610900",
  "id" : "610929",
  "fullname" : "白河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "611000",
  "id" : "611002",
  "fullname" : "商州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "611000",
  "id" : "611021",
  "fullname" : "洛南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "611000",
  "id" : "611022",
  "fullname" : "丹凤县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "611000",
  "id" : "611023",
  "fullname" : "商南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "611000",
  "id" : "611024",
  "fullname" : "山阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "611000",
  "id" : "611025",
  "fullname" : "镇安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "611000",
  "id" : "611026",
  "fullname" : "柞水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620100",
  "id" : "620102",
  "fullname" : "城关区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620100",
  "id" : "620103",
  "fullname" : "七里河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620100",
  "id" : "620104",
  "fullname" : "西固区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620100",
  "id" : "620105",
  "fullname" : "安宁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620100",
  "id" : "620111",
  "fullname" : "红古区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620100",
  "id" : "620121",
  "fullname" : "永登县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620100",
  "id" : "620122",
  "fullname" : "皋兰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620100",
  "id" : "620123",
  "fullname" : "榆中县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620200",
  "id" : "620299",
  "fullname" : "嘉峪关市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620300",
  "id" : "620302",
  "fullname" : "金川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620300",
  "id" : "620321",
  "fullname" : "永昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620400",
  "id" : "620402",
  "fullname" : "白银区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620400",
  "id" : "620403",
  "fullname" : "平川区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620400",
  "id" : "620421",
  "fullname" : "靖远县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620400",
  "id" : "620422",
  "fullname" : "会宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620400",
  "id" : "620423",
  "fullname" : "景泰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620500",
  "id" : "620502",
  "fullname" : "秦州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620500",
  "id" : "620503",
  "fullname" : "麦积区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620500",
  "id" : "620521",
  "fullname" : "清水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620500",
  "id" : "620522",
  "fullname" : "秦安县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620500",
  "id" : "620523",
  "fullname" : "甘谷县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620500",
  "id" : "620524",
  "fullname" : "武山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620500",
  "id" : "620525",
  "fullname" : "张家川回族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620600",
  "id" : "620602",
  "fullname" : "凉州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620600",
  "id" : "620621",
  "fullname" : "民勤县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620600",
  "id" : "620622",
  "fullname" : "古浪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620600",
  "id" : "620623",
  "fullname" : "天祝藏族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620700",
  "id" : "620702",
  "fullname" : "甘州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620700",
  "id" : "620721",
  "fullname" : "肃南裕固族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620700",
  "id" : "620722",
  "fullname" : "民乐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620700",
  "id" : "620723",
  "fullname" : "临泽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620700",
  "id" : "620724",
  "fullname" : "高台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620700",
  "id" : "620725",
  "fullname" : "山丹县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620800",
  "id" : "620802",
  "fullname" : "崆峒区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620800",
  "id" : "620821",
  "fullname" : "泾川县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620800",
  "id" : "620822",
  "fullname" : "灵台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620800",
  "id" : "620823",
  "fullname" : "崇信县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620800",
  "id" : "620825",
  "fullname" : "庄浪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620800",
  "id" : "620826",
  "fullname" : "静宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620800",
  "id" : "620881",
  "fullname" : "华亭市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620900",
  "id" : "620902",
  "fullname" : "肃州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620900",
  "id" : "620921",
  "fullname" : "金塔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620900",
  "id" : "620922",
  "fullname" : "瓜州县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620900",
  "id" : "620923",
  "fullname" : "肃北蒙古族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620900",
  "id" : "620924",
  "fullname" : "阿克塞哈萨克族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620900",
  "id" : "620981",
  "fullname" : "玉门市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "620900",
  "id" : "620982",
  "fullname" : "敦煌市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621000",
  "id" : "621002",
  "fullname" : "西峰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621000",
  "id" : "621021",
  "fullname" : "庆城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621000",
  "id" : "621022",
  "fullname" : "环县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621000",
  "id" : "621023",
  "fullname" : "华池县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621000",
  "id" : "621024",
  "fullname" : "合水县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621000",
  "id" : "621025",
  "fullname" : "正宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621000",
  "id" : "621026",
  "fullname" : "宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621000",
  "id" : "621027",
  "fullname" : "镇原县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621100",
  "id" : "621102",
  "fullname" : "安定区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621100",
  "id" : "621121",
  "fullname" : "通渭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621100",
  "id" : "621122",
  "fullname" : "陇西县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621100",
  "id" : "621123",
  "fullname" : "渭源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621100",
  "id" : "621124",
  "fullname" : "临洮县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621100",
  "id" : "621125",
  "fullname" : "漳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621100",
  "id" : "621126",
  "fullname" : "岷县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621202",
  "fullname" : "武都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621221",
  "fullname" : "成县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621222",
  "fullname" : "文县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621223",
  "fullname" : "宕昌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621224",
  "fullname" : "康县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621225",
  "fullname" : "西和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621226",
  "fullname" : "礼县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621227",
  "fullname" : "徽县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "621200",
  "id" : "621228",
  "fullname" : "两当县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "622900",
  "id" : "622901",
  "fullname" : "临夏市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "622900",
  "id" : "622921",
  "fullname" : "临夏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "622900",
  "id" : "622922",
  "fullname" : "康乐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "622900",
  "id" : "622923",
  "fullname" : "永靖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "622900",
  "id" : "622924",
  "fullname" : "广河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "622900",
  "id" : "622925",
  "fullname" : "和政县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "622900",
  "id" : "622926",
  "fullname" : "东乡族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "622900",
  "id" : "622927",
  "fullname" : "积石山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "623000",
  "id" : "623001",
  "fullname" : "合作市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "623000",
  "id" : "623021",
  "fullname" : "临潭县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "623000",
  "id" : "623022",
  "fullname" : "卓尼县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "623000",
  "id" : "623023",
  "fullname" : "舟曲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "623000",
  "id" : "623024",
  "fullname" : "迭部县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "623000",
  "id" : "623025",
  "fullname" : "玛曲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "623000",
  "id" : "623026",
  "fullname" : "碌曲县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "623000",
  "id" : "623027",
  "fullname" : "夏河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630100",
  "id" : "630102",
  "fullname" : "城东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630100",
  "id" : "630103",
  "fullname" : "城中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630100",
  "id" : "630104",
  "fullname" : "城西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630100",
  "id" : "630105",
  "fullname" : "城北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630100",
  "id" : "630106",
  "fullname" : "湟中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630100",
  "id" : "630121",
  "fullname" : "大通回族土族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630100",
  "id" : "630123",
  "fullname" : "湟源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630200",
  "id" : "630202",
  "fullname" : "乐都区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630200",
  "id" : "630203",
  "fullname" : "平安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630200",
  "id" : "630222",
  "fullname" : "民和回族土族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630200",
  "id" : "630223",
  "fullname" : "互助土族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630200",
  "id" : "630224",
  "fullname" : "化隆回族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "630200",
  "id" : "630225",
  "fullname" : "循化撒拉族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632200",
  "id" : "632221",
  "fullname" : "门源回族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632200",
  "id" : "632222",
  "fullname" : "祁连县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632200",
  "id" : "632223",
  "fullname" : "海晏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632200",
  "id" : "632224",
  "fullname" : "刚察县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632300",
  "id" : "632301",
  "fullname" : "同仁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632300",
  "id" : "632322",
  "fullname" : "尖扎县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632300",
  "id" : "632323",
  "fullname" : "泽库县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632300",
  "id" : "632324",
  "fullname" : "河南蒙古族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632500",
  "id" : "632521",
  "fullname" : "共和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632500",
  "id" : "632522",
  "fullname" : "同德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632500",
  "id" : "632523",
  "fullname" : "贵德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632500",
  "id" : "632524",
  "fullname" : "兴海县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632500",
  "id" : "632525",
  "fullname" : "贵南县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632600",
  "id" : "632621",
  "fullname" : "玛沁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632600",
  "id" : "632622",
  "fullname" : "班玛县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632600",
  "id" : "632623",
  "fullname" : "甘德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632600",
  "id" : "632624",
  "fullname" : "达日县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632600",
  "id" : "632625",
  "fullname" : "久治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632600",
  "id" : "632626",
  "fullname" : "玛多县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632700",
  "id" : "632701",
  "fullname" : "玉树市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632700",
  "id" : "632722",
  "fullname" : "杂多县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632700",
  "id" : "632723",
  "fullname" : "称多县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632700",
  "id" : "632724",
  "fullname" : "治多县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632700",
  "id" : "632725",
  "fullname" : "囊谦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632700",
  "id" : "632726",
  "fullname" : "曲麻莱县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632800",
  "id" : "632801",
  "fullname" : "格尔木市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632800",
  "id" : "632802",
  "fullname" : "德令哈市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632800",
  "id" : "632803",
  "fullname" : "茫崖市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632800",
  "id" : "632821",
  "fullname" : "乌兰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632800",
  "id" : "632822",
  "fullname" : "都兰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632800",
  "id" : "632823",
  "fullname" : "天峻县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "632800",
  "id" : "632825",
  "fullname" : "大柴旦行政委员会"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640100",
  "id" : "640104",
  "fullname" : "兴庆区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640100",
  "id" : "640105",
  "fullname" : "西夏区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640100",
  "id" : "640106",
  "fullname" : "金凤区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640100",
  "id" : "640121",
  "fullname" : "永宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640100",
  "id" : "640122",
  "fullname" : "贺兰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640100",
  "id" : "640181",
  "fullname" : "灵武市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640200",
  "id" : "640202",
  "fullname" : "大武口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640200",
  "id" : "640205",
  "fullname" : "惠农区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640200",
  "id" : "640221",
  "fullname" : "平罗县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640300",
  "id" : "640302",
  "fullname" : "利通区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640300",
  "id" : "640303",
  "fullname" : "红寺堡区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640300",
  "id" : "640323",
  "fullname" : "盐池县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640300",
  "id" : "640324",
  "fullname" : "同心县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640300",
  "id" : "640381",
  "fullname" : "青铜峡市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640400",
  "id" : "640402",
  "fullname" : "原州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640400",
  "id" : "640422",
  "fullname" : "西吉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640400",
  "id" : "640423",
  "fullname" : "隆德县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640400",
  "id" : "640424",
  "fullname" : "泾源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640400",
  "id" : "640425",
  "fullname" : "彭阳县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640500",
  "id" : "640502",
  "fullname" : "沙坡头区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640500",
  "id" : "640521",
  "fullname" : "中宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "640500",
  "id" : "640522",
  "fullname" : "海原县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650100",
  "id" : "650102",
  "fullname" : "天山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650100",
  "id" : "650103",
  "fullname" : "沙依巴克区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650100",
  "id" : "650104",
  "fullname" : "新市区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650100",
  "id" : "650105",
  "fullname" : "水磨沟区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650100",
  "id" : "650106",
  "fullname" : "头屯河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650100",
  "id" : "650107",
  "fullname" : "达坂城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650100",
  "id" : "650109",
  "fullname" : "米东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650100",
  "id" : "650121",
  "fullname" : "乌鲁木齐县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650200",
  "id" : "650202",
  "fullname" : "独山子区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650200",
  "id" : "650203",
  "fullname" : "克拉玛依区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650200",
  "id" : "650204",
  "fullname" : "白碱滩区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650200",
  "id" : "650205",
  "fullname" : "乌尔禾区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650400",
  "id" : "650402",
  "fullname" : "高昌区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650400",
  "id" : "650421",
  "fullname" : "鄯善县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650400",
  "id" : "650422",
  "fullname" : "托克逊县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650500",
  "id" : "650502",
  "fullname" : "伊州区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650500",
  "id" : "650521",
  "fullname" : "巴里坤哈萨克自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "650500",
  "id" : "650522",
  "fullname" : "伊吾县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652300",
  "id" : "652301",
  "fullname" : "昌吉市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652300",
  "id" : "652302",
  "fullname" : "阜康市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652300",
  "id" : "652323",
  "fullname" : "呼图壁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652300",
  "id" : "652324",
  "fullname" : "玛纳斯县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652300",
  "id" : "652325",
  "fullname" : "奇台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652300",
  "id" : "652327",
  "fullname" : "吉木萨尔县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652300",
  "id" : "652328",
  "fullname" : "木垒哈萨克自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652700",
  "id" : "652701",
  "fullname" : "博乐市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652700",
  "id" : "652702",
  "fullname" : "阿拉山口市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652700",
  "id" : "652722",
  "fullname" : "精河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652700",
  "id" : "652723",
  "fullname" : "温泉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652801",
  "fullname" : "库尔勒市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652822",
  "fullname" : "轮台县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652823",
  "fullname" : "尉犁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652824",
  "fullname" : "若羌县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652825",
  "fullname" : "且末县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652826",
  "fullname" : "焉耆回族自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652827",
  "fullname" : "和静县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652828",
  "fullname" : "和硕县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652800",
  "id" : "652829",
  "fullname" : "博湖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652901",
  "fullname" : "阿克苏市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652902",
  "fullname" : "库车市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652922",
  "fullname" : "温宿县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652924",
  "fullname" : "沙雅县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652925",
  "fullname" : "新和县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652926",
  "fullname" : "拜城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652927",
  "fullname" : "乌什县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652928",
  "fullname" : "阿瓦提县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "652900",
  "id" : "652929",
  "fullname" : "柯坪县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653000",
  "id" : "653001",
  "fullname" : "阿图什市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653000",
  "id" : "653022",
  "fullname" : "阿克陶县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653000",
  "id" : "653023",
  "fullname" : "阿合奇县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653000",
  "id" : "653024",
  "fullname" : "乌恰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653101",
  "fullname" : "喀什市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653121",
  "fullname" : "疏附县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653122",
  "fullname" : "疏勒县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653123",
  "fullname" : "英吉沙县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653124",
  "fullname" : "泽普县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653125",
  "fullname" : "莎车县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653126",
  "fullname" : "叶城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653127",
  "fullname" : "麦盖提县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653128",
  "fullname" : "岳普湖县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653129",
  "fullname" : "伽师县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653130",
  "fullname" : "巴楚县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653100",
  "id" : "653131",
  "fullname" : "塔什库尔干塔吉克自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653200",
  "id" : "653201",
  "fullname" : "和田市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653200",
  "id" : "653221",
  "fullname" : "和田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653200",
  "id" : "653222",
  "fullname" : "墨玉县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653200",
  "id" : "653223",
  "fullname" : "皮山县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653200",
  "id" : "653224",
  "fullname" : "洛浦县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653200",
  "id" : "653225",
  "fullname" : "策勒县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653200",
  "id" : "653226",
  "fullname" : "于田县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "653200",
  "id" : "653227",
  "fullname" : "民丰县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654002",
  "fullname" : "伊宁市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654003",
  "fullname" : "奎屯市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654004",
  "fullname" : "霍尔果斯市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654021",
  "fullname" : "伊宁县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654022",
  "fullname" : "察布查尔锡伯自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654023",
  "fullname" : "霍城县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654024",
  "fullname" : "巩留县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654025",
  "fullname" : "新源县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654026",
  "fullname" : "昭苏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654027",
  "fullname" : "特克斯县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654000",
  "id" : "654028",
  "fullname" : "尼勒克县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654200",
  "id" : "654201",
  "fullname" : "塔城市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654200",
  "id" : "654202",
  "fullname" : "乌苏市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654200",
  "id" : "654221",
  "fullname" : "额敏县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654200",
  "id" : "654223",
  "fullname" : "沙湾县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654200",
  "id" : "654224",
  "fullname" : "托里县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654200",
  "id" : "654225",
  "fullname" : "裕民县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654200",
  "id" : "654226",
  "fullname" : "和布克赛尔蒙古自治县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654300",
  "id" : "654301",
  "fullname" : "阿勒泰市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654300",
  "id" : "654321",
  "fullname" : "布尔津县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654300",
  "id" : "654322",
  "fullname" : "富蕴县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654300",
  "id" : "654323",
  "fullname" : "福海县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654300",
  "id" : "654324",
  "fullname" : "哈巴河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654300",
  "id" : "654325",
  "fullname" : "青河县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "654300",
  "id" : "654326",
  "fullname" : "吉木乃县"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710101",
  "fullname" : "中正区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710102",
  "fullname" : "大同区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710103",
  "fullname" : "中山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710104",
  "fullname" : "松山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710105",
  "fullname" : "大安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710106",
  "fullname" : "万华区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710107",
  "fullname" : "信义区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710108",
  "fullname" : "士林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710109",
  "fullname" : "北投区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710110",
  "fullname" : "内湖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710111",
  "fullname" : "南港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710100",
  "id" : "710112",
  "fullname" : "文山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710201",
  "fullname" : "新兴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710202",
  "fullname" : "前金区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710203",
  "fullname" : "苓雅区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710204",
  "fullname" : "盐埕区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710205",
  "fullname" : "鼓山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710206",
  "fullname" : "旗津区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710207",
  "fullname" : "前镇区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710208",
  "fullname" : "三民区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710209",
  "fullname" : "左营区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710210",
  "fullname" : "楠梓区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710211",
  "fullname" : "小港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710242",
  "fullname" : "仁武区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710243",
  "fullname" : "大社区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710244",
  "fullname" : "冈山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710245",
  "fullname" : "路竹区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710246",
  "fullname" : "阿莲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710247",
  "fullname" : "田寮区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710248",
  "fullname" : "燕巢区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710249",
  "fullname" : "桥头区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710250",
  "fullname" : "梓官区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710251",
  "fullname" : "弥陀区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710252",
  "fullname" : "永安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710253",
  "fullname" : "湖内区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710254",
  "fullname" : "凤山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710255",
  "fullname" : "大寮区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710256",
  "fullname" : "林园区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710257",
  "fullname" : "鸟松区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710258",
  "fullname" : "大树区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710259",
  "fullname" : "旗山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710260",
  "fullname" : "美浓区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710261",
  "fullname" : "六龟区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710262",
  "fullname" : "内门区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710263",
  "fullname" : "杉林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710264",
  "fullname" : "甲仙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710265",
  "fullname" : "桃源区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710266",
  "fullname" : "那玛夏区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710267",
  "fullname" : "茂林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710200",
  "id" : "710268",
  "fullname" : "茄萣区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710301",
  "fullname" : "中西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710302",
  "fullname" : "东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710303",
  "fullname" : "南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710304",
  "fullname" : "北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710305",
  "fullname" : "安平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710306",
  "fullname" : "安南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710339",
  "fullname" : "永康区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710340",
  "fullname" : "归仁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710341",
  "fullname" : "新化区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710342",
  "fullname" : "左镇区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710343",
  "fullname" : "玉井区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710344",
  "fullname" : "楠西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710345",
  "fullname" : "南化区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710346",
  "fullname" : "仁德区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710347",
  "fullname" : "关庙区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710348",
  "fullname" : "龙崎区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710349",
  "fullname" : "官田区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710350",
  "fullname" : "麻豆区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710351",
  "fullname" : "佳里区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710352",
  "fullname" : "西港区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710353",
  "fullname" : "七股区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710354",
  "fullname" : "将军区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710355",
  "fullname" : "学甲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710356",
  "fullname" : "北门区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710357",
  "fullname" : "新营区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710358",
  "fullname" : "后壁区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710359",
  "fullname" : "白河区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710360",
  "fullname" : "东山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710361",
  "fullname" : "六甲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710362",
  "fullname" : "下营区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710363",
  "fullname" : "柳营区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710364",
  "fullname" : "盐水区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710365",
  "fullname" : "善化区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710366",
  "fullname" : "大内区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710367",
  "fullname" : "山上区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710368",
  "fullname" : "新市区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710300",
  "id" : "710369",
  "fullname" : "安定区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710401",
  "fullname" : "中区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710402",
  "fullname" : "东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710403",
  "fullname" : "南区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710404",
  "fullname" : "西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710405",
  "fullname" : "北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710406",
  "fullname" : "北屯区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710407",
  "fullname" : "西屯区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710408",
  "fullname" : "南屯区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710431",
  "fullname" : "太平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710432",
  "fullname" : "大里区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710433",
  "fullname" : "雾峰区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710434",
  "fullname" : "乌日区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710435",
  "fullname" : "丰原区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710436",
  "fullname" : "后里区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710437",
  "fullname" : "石冈区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710438",
  "fullname" : "东势区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710439",
  "fullname" : "和平区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710440",
  "fullname" : "新社区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710441",
  "fullname" : "潭子区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710442",
  "fullname" : "大雅区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710443",
  "fullname" : "神冈区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710444",
  "fullname" : "大肚区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710445",
  "fullname" : "沙鹿区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710446",
  "fullname" : "龙井区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710447",
  "fullname" : "梧栖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710448",
  "fullname" : "清水区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710449",
  "fullname" : "大甲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710450",
  "fullname" : "外埔区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710400",
  "id" : "710451",
  "fullname" : "大安区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710614",
  "fullname" : "南投市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710615",
  "fullname" : "中寮乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710616",
  "fullname" : "草屯镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710617",
  "fullname" : "国姓乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710618",
  "fullname" : "埔里镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710619",
  "fullname" : "仁爱乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710620",
  "fullname" : "名间乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710621",
  "fullname" : "集集镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710622",
  "fullname" : "水里乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710623",
  "fullname" : "鱼池乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710624",
  "fullname" : "信义乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710625",
  "fullname" : "竹山镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710600",
  "id" : "710626",
  "fullname" : "鹿谷乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710700",
  "id" : "710701",
  "fullname" : "仁爱区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710700",
  "id" : "710702",
  "fullname" : "信义区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710700",
  "id" : "710703",
  "fullname" : "中正区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710700",
  "id" : "710704",
  "fullname" : "中山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710700",
  "id" : "710705",
  "fullname" : "安乐区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710700",
  "id" : "710706",
  "fullname" : "暖暖区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710700",
  "id" : "710707",
  "fullname" : "七堵区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710800",
  "id" : "710801",
  "fullname" : "东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710800",
  "id" : "710802",
  "fullname" : "北区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710800",
  "id" : "710803",
  "fullname" : "香山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710900",
  "id" : "710901",
  "fullname" : "东区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "710900",
  "id" : "710902",
  "fullname" : "西区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711130",
  "fullname" : "万里区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711131",
  "fullname" : "金山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711132",
  "fullname" : "板桥区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711133",
  "fullname" : "汐止区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711134",
  "fullname" : "深坑区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711135",
  "fullname" : "石碇区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711136",
  "fullname" : "瑞芳区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711137",
  "fullname" : "平溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711138",
  "fullname" : "双溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711139",
  "fullname" : "贡寮区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711140",
  "fullname" : "新店区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711141",
  "fullname" : "坪林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711142",
  "fullname" : "乌来区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711143",
  "fullname" : "永和区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711144",
  "fullname" : "中和区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711145",
  "fullname" : "土城区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711146",
  "fullname" : "三峡区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711147",
  "fullname" : "树林区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711148",
  "fullname" : "莺歌区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711149",
  "fullname" : "三重区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711150",
  "fullname" : "新庄区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711151",
  "fullname" : "泰山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711152",
  "fullname" : "林口区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711153",
  "fullname" : "芦洲区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711154",
  "fullname" : "五股区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711155",
  "fullname" : "八里区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711156",
  "fullname" : "淡水区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711157",
  "fullname" : "三芝区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711100",
  "id" : "711158",
  "fullname" : "石门区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711214",
  "fullname" : "宜兰市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711215",
  "fullname" : "头城镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711216",
  "fullname" : "礁溪乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711217",
  "fullname" : "壮围乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711218",
  "fullname" : "员山乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711219",
  "fullname" : "罗东镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711220",
  "fullname" : "三星乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711221",
  "fullname" : "大同乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711222",
  "fullname" : "五结乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711223",
  "fullname" : "冬山乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711224",
  "fullname" : "苏澳镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711200",
  "id" : "711225",
  "fullname" : "南澳乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711314",
  "fullname" : "竹北市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711315",
  "fullname" : "湖口乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711316",
  "fullname" : "新丰乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711317",
  "fullname" : "新埔镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711318",
  "fullname" : "关西镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711319",
  "fullname" : "芎林乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711320",
  "fullname" : "宝山乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711321",
  "fullname" : "竹东镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711322",
  "fullname" : "五峰乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711323",
  "fullname" : "横山乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711324",
  "fullname" : "尖石乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711325",
  "fullname" : "北埔乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711300",
  "id" : "711326",
  "fullname" : "峨眉乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711414",
  "fullname" : "中坜区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711415",
  "fullname" : "平镇区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711416",
  "fullname" : "龙潭区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711417",
  "fullname" : "杨梅区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711418",
  "fullname" : "新屋区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711419",
  "fullname" : "观音区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711420",
  "fullname" : "桃园区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711421",
  "fullname" : "龟山区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711422",
  "fullname" : "八德区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711423",
  "fullname" : "大溪区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711424",
  "fullname" : "复兴区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711425",
  "fullname" : "大园区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711400",
  "id" : "711426",
  "fullname" : "芦竹区"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711519",
  "fullname" : "竹南镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711520",
  "fullname" : "头份市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711521",
  "fullname" : "三湾乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711522",
  "fullname" : "南庄乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711523",
  "fullname" : "狮潭乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711524",
  "fullname" : "后龙镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711525",
  "fullname" : "通霄镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711526",
  "fullname" : "苑里镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711527",
  "fullname" : "苗栗市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711528",
  "fullname" : "造桥乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711529",
  "fullname" : "头屋乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711530",
  "fullname" : "公馆乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711531",
  "fullname" : "大湖乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711532",
  "fullname" : "泰安乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711533",
  "fullname" : "铜锣乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711534",
  "fullname" : "三义乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711535",
  "fullname" : "西湖乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711500",
  "id" : "711536",
  "fullname" : "卓兰镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711727",
  "fullname" : "彰化市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711728",
  "fullname" : "芬园乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711729",
  "fullname" : "花坛乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711730",
  "fullname" : "秀水乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711731",
  "fullname" : "鹿港镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711732",
  "fullname" : "福兴乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711733",
  "fullname" : "线西乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711734",
  "fullname" : "和美镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711735",
  "fullname" : "伸港乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711736",
  "fullname" : "员林市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711737",
  "fullname" : "社头乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711738",
  "fullname" : "永靖乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711739",
  "fullname" : "埔心乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711740",
  "fullname" : "溪湖镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711741",
  "fullname" : "大村乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711742",
  "fullname" : "埔盐乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711743",
  "fullname" : "田中镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711744",
  "fullname" : "北斗镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711745",
  "fullname" : "田尾乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711746",
  "fullname" : "埤头乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711747",
  "fullname" : "溪州乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711748",
  "fullname" : "竹塘乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711749",
  "fullname" : "二林镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711750",
  "fullname" : "大城乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711751",
  "fullname" : "芳苑乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711700",
  "id" : "711752",
  "fullname" : "二水乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711919",
  "fullname" : "番路乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711920",
  "fullname" : "梅山乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711921",
  "fullname" : "竹崎乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711922",
  "fullname" : "阿里山乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711923",
  "fullname" : "中埔乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711924",
  "fullname" : "大埔乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711925",
  "fullname" : "水上乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711926",
  "fullname" : "鹿草乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711927",
  "fullname" : "太保市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711928",
  "fullname" : "朴子市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711929",
  "fullname" : "东石乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711930",
  "fullname" : "六脚乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711931",
  "fullname" : "新港乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711932",
  "fullname" : "民雄乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711933",
  "fullname" : "大林镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711934",
  "fullname" : "溪口乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711935",
  "fullname" : "义竹乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "711900",
  "id" : "711936",
  "fullname" : "布袋镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712121",
  "fullname" : "斗南镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712122",
  "fullname" : "大埤乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712123",
  "fullname" : "虎尾镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712124",
  "fullname" : "土库镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712125",
  "fullname" : "褒忠乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712126",
  "fullname" : "东势乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712127",
  "fullname" : "台西乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712128",
  "fullname" : "仑背乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712129",
  "fullname" : "麦寮乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712130",
  "fullname" : "斗六市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712131",
  "fullname" : "林内乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712132",
  "fullname" : "古坑乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712133",
  "fullname" : "莿桐乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712134",
  "fullname" : "西螺镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712135",
  "fullname" : "二仑乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712136",
  "fullname" : "北港镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712137",
  "fullname" : "水林乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712138",
  "fullname" : "口湖乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712139",
  "fullname" : "四湖乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712100",
  "id" : "712140",
  "fullname" : "元长乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712434",
  "fullname" : "屏东市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712435",
  "fullname" : "三地门乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712436",
  "fullname" : "雾台乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712437",
  "fullname" : "玛家乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712438",
  "fullname" : "九如乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712439",
  "fullname" : "里港乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712440",
  "fullname" : "高树乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712441",
  "fullname" : "盐埔乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712442",
  "fullname" : "长治乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712443",
  "fullname" : "麟洛乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712444",
  "fullname" : "竹田乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712445",
  "fullname" : "内埔乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712446",
  "fullname" : "万丹乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712447",
  "fullname" : "潮州镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712448",
  "fullname" : "泰武乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712449",
  "fullname" : "来义乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712450",
  "fullname" : "万峦乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712451",
  "fullname" : "崁顶乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712452",
  "fullname" : "新埤乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712453",
  "fullname" : "南州乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712454",
  "fullname" : "林边乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712455",
  "fullname" : "东港镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712456",
  "fullname" : "琉球乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712457",
  "fullname" : "佳冬乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712458",
  "fullname" : "新园乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712459",
  "fullname" : "枋寮乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712460",
  "fullname" : "枋山乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712461",
  "fullname" : "春日乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712462",
  "fullname" : "狮子乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712463",
  "fullname" : "车城乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712464",
  "fullname" : "牡丹乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712465",
  "fullname" : "恒春镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712400",
  "id" : "712466",
  "fullname" : "满州乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712517",
  "fullname" : "台东市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712518",
  "fullname" : "绿岛乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712519",
  "fullname" : "兰屿乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712520",
  "fullname" : "延平乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712521",
  "fullname" : "卑南乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712522",
  "fullname" : "鹿野乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712523",
  "fullname" : "关山镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712524",
  "fullname" : "海端乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712525",
  "fullname" : "池上乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712526",
  "fullname" : "东河乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712527",
  "fullname" : "成功镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712528",
  "fullname" : "长滨乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712529",
  "fullname" : "金峰乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712530",
  "fullname" : "大武乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712531",
  "fullname" : "达仁乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712500",
  "id" : "712532",
  "fullname" : "太麻里乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712615",
  "fullname" : "花莲市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712616",
  "fullname" : "新城乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712618",
  "fullname" : "秀林乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712619",
  "fullname" : "吉安乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712620",
  "fullname" : "寿丰乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712621",
  "fullname" : "凤林镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712622",
  "fullname" : "光复乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712623",
  "fullname" : "丰滨乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712624",
  "fullname" : "瑞穗乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712625",
  "fullname" : "万荣乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712626",
  "fullname" : "玉里镇"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712627",
  "fullname" : "卓溪乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712600",
  "id" : "712628",
  "fullname" : "富里乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712700",
  "id" : "712707",
  "fullname" : "马公市"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712700",
  "id" : "712708",
  "fullname" : "西屿乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712700",
  "id" : "712709",
  "fullname" : "望安乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712700",
  "id" : "712710",
  "fullname" : "七美乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712700",
  "id" : "712711",
  "fullname" : "白沙乡"
}, {
  "level" : 3,
  "name" : null,
  "pid" : "712700",
  "id" : "712712",
  "fullname" : "湖西乡"
} ]
''';

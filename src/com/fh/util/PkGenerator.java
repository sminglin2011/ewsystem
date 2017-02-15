//package com.fh.util;
//
//import java.util.Date;
//
//import javax.annotation.Resource;
//
//import org.apache.commons.lang3.time.DateFormatUtils;
//import org.springframework.transaction.annotation.Propagation;
//import org.springframework.transaction.annotation.Transactional;
//
//
///**
// * 序列生成
// * 
// *
// */
//public class PkGenerator {
//
//    static final String SEQ_DATA_FORMAT = "yyyyMMdd";
//
//    @Resource(name = "accountMapper")
//    private Mapper mapper;
//
//    /**
//     * 生成序列
//     * 
//     * @param seqName 序列名称
//     * @param prefix 前缀
//     * @return
//     */
//    @Transactional(propagation = Propagation.NOT_SUPPORTED)
//    public String genPk(String seqName, String prefix) {
//        return this.genPk(seqName, prefix, 4);
//    }
//
//    /**
//     * 生成序列，长度超过设置长度不会跑出异常
//     * 
//     * @param seqName 序列名称
//     * @param prefix 前缀
//     * @return
//     */
//    @Transactional(propagation = Propagation.NOT_SUPPORTED)
//    public String genPk(String seqName, String prefix, int length) {
//
//        StringBuilder sb = new StringBuilder(prefix);
//
//        int seq = 0;
//        seq = mapper.selectSeq(seqName, 1);
//
//        String seqstr =  getFixedLengthString(String.valueOf(seq), length);
//        sb.append(DateFormatUtils.format(new Date(), SEQ_DATA_FORMAT)).append(seqstr);
//
//        return sb.toString().toUpperCase();
//    }
//
//    /**
//     * 生成序列，该序列号不会清零处理，只会进行历史累加
//
//     * 长度超过设置长度抛出异常
//     * 
//     * @param seqName String 序列名称
//     * @param length int 固定长度
//     * 
//     * @return
//     */
//    @Transactional(propagation = Propagation.NOT_SUPPORTED)
//    public String genPk2(String seqName, int length) {
//        StringBuilder sb = new StringBuilder();
//
//        int seq = 0;
//        seq = mapper.getSeqNum(seqName, 1);
//
//        String seqstr =  getFixedLengthString(String.valueOf(seq), length);
//
//        if (seqstr.length() > length)
//            throw new IllegalArgumentException("序列号长度超过长度限制。");
//
//        sb.append(seqstr);
//
//        return seqstr;
//    }
//
//    /**
//     * 生成int类型序列
//     * 
//     * @param seqName 序列名称
//     * @return
//     */
//    @Transactional(propagation = Propagation.NOT_SUPPORTED)
//    public int getSeqNum(String seqName) {
//        return this.getSeqNum(seqName, 1);
//    }
//
//    /**
//     * 生成int类型序列
//     * 
//     * @param seqName 序列名称
//     * @return
//     */
//    @Transactional(propagation = Propagation.NOT_SUPPORTED)
//    public int getSeqNum(String seqName, int length) {
//        return mapper.getSeqNum(seqName, length);
//    }
//
//    /**
//     * 获取固定长度字符串，不足0补，长度超过直接返回
//     */
//    public String getFixedLengthString(String raw, int length) {
//        if (raw == null)
//            throw new MandoErrorMessageException("raw data is null");
//
//        int size = raw.length();
//
//        if (size >= length)
//            return raw;
//
//        int fillSize = length - size;
//
//        return new StringBuilder().append(getLengthZero(fillSize)).append(raw).toString();
//    }
//
//}
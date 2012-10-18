/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package sdpd.bargeproject.web;

import org.slf4j.Logger.*;
import org.slf4j.LoggerFactory.*;
/**
 *
 * @author Pavan
 */
public class ProcessBargeData {
    public String strBargeName;
    public String strBargeLat;
    public String strBargeLong;
    public String strBargeStat;
    private String strBargeTime;
    public String authTokenID;
    public int bargeLat;
    public int bargeLong;
    /**
     * @return the strBargeName
     */
    public String getStrBargeName() {
        return strBargeName;
    }

    /**
     * @param strBargeName the strBargeName to set
     */
    public void setStrBargeName(String strBargeName) {
        this.strBargeName = strBargeName;
    }

    /**
     * @return the strBargeLat
     */
    public String getStrBargeLat() {
        return strBargeLat;
    }

    /**
     * @param strBargeLat the strBargeLat to set
     */
    public void setStrBargeLat(String strBargeLat) {
        this.strBargeLat = strBargeLat;
    }

    /**
     * @return the strBargeLong
     */
    public String getStrBargeLong() {
        return strBargeLong;
    }

    /**
     * @param strBargeLong the strBargeLong to set
     */
    public void setStrBargeLong(String strBargeLong) {
        this.strBargeLong = strBargeLong;
    }

    /**
     * @return the strBargeStat
     */
    public String getStrBargeStat() {
        return strBargeStat;
    }

    /**
     * @param strBargeStat the strBargeStat to set
     */
    public void setStrBargeStat(String strBargeStat) {
        this.strBargeStat = strBargeStat;
    }

    /**
     * @return the bargeName
     */
//    public float getBargeLong() {
//        return bargeLong;
//    }
//
//    /**
//     * @param bargeName the bargeName to set
//     */
//    public void setBargeLong(String strBargeLong) {
//        this.bargeLong = Float.valueOf(strBargeLong).floatValue();
//
//    }
//
//    /**
//     * @return the bargeLat
//     */
//    public float getBargeLat() {
//        return bargeLat;
//    }
//
//    /**
//     * @param bargeLat the bargeLat to set
//     */
//    public void setBargeLat(String strBargeLat) {
//        this.bargeLat = Float.valueOf(strBargeLat).floatValue();
//    }

    
   
    /**
     * @return the strBargeTime
     */
    public String getStrBargeTime() {
        return strBargeTime;
    }

    /**
     * @param strBargeTime the strBargeTime to set
     */
    public void setStrBargeTime(String strBargeTime) {
        this.strBargeTime = strBargeTime;
    }
}

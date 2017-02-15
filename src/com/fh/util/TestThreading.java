package com.fh.util;

import java.io.IOException;  
import java.io.InputStream;  
import java.net.URL;  
import java.net.URLConnection;  
import java.util.concurrent.ExecutorService;  
import java.util.concurrent.Executors;
public class TestThreading {

	public static void main(String[] args) throws Exception {  
        //测试的网站URL  
        final URL url=new URL("http://localhost:8080/ewsystem/accountnumberctrl/testThreading");  
        //并发数量  
        final int concurrentNum=100;  
        ExecutorService pool=  Executors.newCachedThreadPool();  
        for (int i = 0; i < concurrentNum; i++) {  
            pool.execute(new Runnable() {  
                  
                @Override  
                public void run() {  
                    try {  
                        while(true){  
                            URLConnection connection= url.openConnection();  
                            InputStream inStream= connection.getInputStream();  
                            byte [] buff=new byte[1024];  
                            int len=-1;  
                            while((len=inStream.read(buff))!=-1){  
                                try {  
                                    Thread.sleep(10);  
                                    System.out.println(new String(buff,0,len));  
                                } catch (InterruptedException e) {  
                                    e.printStackTrace();  
                                }  
                                  
                            }  
                        }  
                          
                    } catch (IOException e) {  
                        e.printStackTrace();  
                    }  
                      
                }  
            });  
              
        }  
    }  
}

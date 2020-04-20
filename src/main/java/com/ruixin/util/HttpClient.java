package com.ruixin.util;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * @author shijingbang
 * @Description:http请求工具类
 * @Date 2015年11月18日
 */
public class HttpClient {
    private static final Logger logger = LoggerFactory.getLogger(HttpClient.class);
    private static final String DEFAULT_CHARSET = "UTF-8";

    /**
     * 发送post请求
     *
     * @param url      请求URL
     * @param paramMap 请求参数map
     * @return
     */
    public static String post4Map(String url, Map<String, String> paramMap) {
        // 创建默认的httpClient实例.
        CloseableHttpClient httpClient = HttpClients.createDefault();
        // 创建httppost 发送post请求
        HttpPost httpPost = new HttpPost(url);
        // 创建参数列表 ,封装请求参数
        List<NameValuePair> formParams = new ArrayList<NameValuePair>();
        CloseableHttpResponse response = null;

        if (paramMap != null) {
            Iterator<Entry<String, String>> iter = paramMap.entrySet().iterator();
            while (iter.hasNext()) {
                Entry<String, String> entry = iter.next();
                BasicNameValuePair bvp = new BasicNameValuePair(entry.getKey(), entry.getValue());
                formParams.add(bvp);
            }
        }
        UrlEncodedFormEntity urlEncodedFormEntity = null;
        try {
            urlEncodedFormEntity = new UrlEncodedFormEntity(formParams, DEFAULT_CHARSET);
            httpPost.setEntity(urlEncodedFormEntity);
            response = httpClient.execute(httpPost);

            HttpEntity entity = response.getEntity();
            if (entity != null) {
                return EntityUtils.toString(entity, DEFAULT_CHARSET);
            }
        } catch (Exception e) {
            if (logger.isDebugEnabled()) {
                logger.debug("请求异常，错误信息为:{}", e.getMessage());
            }
            throw new RuntimeException(e);
        } finally {
            closeResource(response, httpClient);// 关闭连接，释放资源

        }
        return null;
    }

    /**
     * json格式 post请求
     *
     * @param url
     * @param json
     * @return
     */
    public static String post4Json(String url, String json) {
        // 创建默认的httpClient实例.
        CloseableHttpClient httpClient = HttpClients.createDefault();
        // 创建httppost 发送post请求
        HttpPost httpPost = new HttpPost(url);
        httpPost.addHeader("Content-Type", "application/json");
        CloseableHttpResponse response = null;

        httpPost.setEntity(new StringEntity(json, DEFAULT_CHARSET));
        RequestConfig requestConfig = RequestConfig.custom()
                .setConnectTimeout(2000).setConnectionRequestTimeout(1000)
                .setSocketTimeout(2000).build();
        httpPost.setConfig(requestConfig);
        try {
            response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                return EntityUtils.toString(entity, DEFAULT_CHARSET);
            }
        } catch (Exception e) {
            if (logger.isDebugEnabled()) {
                logger.debug("请求异常，错误信息为:{}", e.getMessage());
            }
            throw new RuntimeException(e);
        } finally {
            closeResource(response, httpClient);// 关闭连接，释放资源

        }

        return null;
    }

    public static String sendGetRequest(String url) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                String data = EntityUtils.toString(entity, DEFAULT_CHARSET);
                return data;
            }
        } catch (Exception e) {
            if (logger.isDebugEnabled()) {
                logger.debug("请求异常，错误信息为:{}", e.getMessage());
            }
            throw new RuntimeException(e);
        } finally {
            closeResource(response, httpClient);// 关闭连接，释放资源
        }
        return "";
    }


    public static String sendGetRequest(String url,String authorization) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        String Au="Bearer "+authorization;
        httpGet.setHeader("Authorization",Au);
        httpGet.setHeader("Accept","application/json");
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                String data = EntityUtils.toString(entity, DEFAULT_CHARSET);
                return data;
            }
        } catch (Exception e) {
            if (logger.isDebugEnabled()) {
                logger.debug("请求异常，错误信息为:{}", e.getMessage());
            }
            throw new RuntimeException(e);
        } finally {
            closeResource(response, httpClient);// 关闭连接，释放资源
        }
        return "";
    }

    private static final void closeResource(CloseableHttpResponse response, CloseableHttpClient httpClient) {
        if (response != null) {
            try {
                response.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (httpClient != null) {
            try {
                httpClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 上传文件
     *
     * @param paramName 文件参数名
     * @param url       上传请求URL
     * @param fileName  文件名
     * @param file      文件对象
     * @return
     * @author bang
     */
    public static String upload(String paramName, String url, String fileName, File file) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        CloseableHttpResponse response = null;
        try {
            // ContentType contentType = ContentType.create("multipart/form-data", Consts.UTF_8);
            // HttpEntity httpEntity = MultipartEntityBuilder.create().setCharset(Consts.UTF_8).setMode(HttpMultipartMode.BROWSER_COMPATIBLE).setBoundary(System.currentTimeMillis() + "")
            // .addBinaryBody(paramName, file, ContentType.DEFAULT_BINARY, fileName).build();
            FileBody fileBody = new FileBody(file);
            HttpEntity httpEntity = MultipartEntityBuilder.create().setMode(HttpMultipartMode.RFC6532).addPart(paramName, fileBody).build();
            httpPost.setEntity(httpEntity);
            response = httpClient.execute(httpPost);
            // System.out.println(response.getStatusLine().getStatusCode());
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                String data = EntityUtils.toString(entity, DEFAULT_CHARSET);
                return data;
            }
        } catch (Exception e) {
            if (logger.isDebugEnabled()) {
                logger.debug("请求异常，错误信息为:{}", e.getMessage());
            }
            throw new RuntimeException(e);
        } finally {
            closeResource(response, httpClient);// 关闭连接，释放资源
        }

        return "";
    }

}

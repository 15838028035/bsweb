package com.lj.app.core.common.flows.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.core.io.ClassPathResource;

import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.util.MagicNumber;

public class FileUtil {
	public static final int DEFAULT_CHUNK_SIZE = 1024;
	public static final int BUFFERSIZE = 4096;
	
	private static final int BUFFER_SIZE = 16 * 1024;
	
	private FileUtil() {

	}

	/**
	 * 读取文件内容 默认是UTF-8编码
	 * 
	 * @param filePath
	 * @return
	 */
	public static String read(String filePath, String code) {
		if (code == null || code.equals("")) {
			code = "UTF-8";
		}
		String fileContent = "";
		File file = new File(filePath);
		try {
			InputStreamReader read = new InputStreamReader(new FileInputStream(
					file), code);
			BufferedReader reader = new BufferedReader(read);
			String line;
			while ((line = reader.readLine()) != null) {
				fileContent = fileContent + line + "\n";
			}
			read.close();
			read = null;
			reader.close();
			read = null;
		} catch (Exception ex) {
			ex.printStackTrace();
			fileContent = "";
		}
		return fileContent;
	}

	/**
	 * 删除文件或文件夹
	 * 
	 * @param filePath
	 */
	public static void delete(String filePath) {
		try {
			File file = new File(filePath);
			if (file.exists()) {
				if (file.isDirectory()) {
					FileUtils.deleteDirectory(file);
				} else {
					file.delete();
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 判断文件是否存在
	 * @param filepath
	 * @return
	 */
	public static boolean exist(String filepath) {
		File file = new File(filepath);
		return file.exists();
	}

	/**
	 * 创建文件夹
	 * 
	 * @param filePath
	 */
	public static void createFolder(String filePath) {
		try {
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
		} catch (Exception ex) {
			System.err.println("Make Folder Error:" + ex.getMessage());
		}
	}

	/**
	 * 通过File对象创建文件
	 * 
	 * @param file
	 * @param filePath
	 */
	public static void createFile(File file, String filePath) {
		int potPos = filePath.lastIndexOf('/') + 1;
		String folderPath = filePath.substring(0, potPos);
		createFolder(folderPath);
		FileOutputStream outputStream = null;
		FileInputStream fileInputStream = null;
		try {
			outputStream = new FileOutputStream(filePath);
			fileInputStream = new FileInputStream(file);
			byte[] by = new byte[1024];
			int c;
			while ((c = fileInputStream.read(by)) != -1) {
				outputStream.write(by, 0, c);
			}
		} catch (IOException e) {
			e.getStackTrace().toString();
		}
		try {
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			fileInputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String readFile(String resource) {
		InputStream stream = getResourceAsStream(resource);
		String content = readStreamToString(stream);
		return content;
	}

	public static InputStream getResourceAsStream(String resource) {
		String stripped = resource.startsWith("/") ? resource.substring(1): resource;
		InputStream stream = null;
		ClassLoader classLoader = Thread.currentThread()
				.getContextClassLoader();
		if (classLoader != null) {
			stream = classLoader.getResourceAsStream(stripped);

		}
		return stream;
	}

	public static String readStreamToString(InputStream stream) {
		String fileContent = "";

		try {
			InputStreamReader read = new InputStreamReader(stream, "utf-8");
			BufferedReader reader = new BufferedReader(read);
			String line;
			while ((line = reader.readLine()) != null) {
				fileContent = fileContent + line + "\n";
			}
			read.close();
			read = null;
			reader.close();
			read = null;
		} catch (Exception ex) {
			fileContent = "";
		}
		return fileContent;
	}
	
	public static byte[] readStreamToByte(InputStream stream) throws Exception {
		String fileContent = readStreamToString(stream);
		return fileContent.getBytes("UTF-8");
	}

	/**
	 * delete file folder
	 * 
	 * @param path
	 */
	public static void removeFile(File path) {

		if (path.isDirectory()) {
			try {
				FileUtils.deleteDirectory(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			FileUtil.delete(path.getAbsolutePath());
		}

	}

	public static void copyFile(String srcFile, String destFile) {
		try {
			if (FileUtil.exist(srcFile)) {
				FileUtils.copyFile(new File(srcFile), new File(destFile));
			}
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public static void copyFile(File src, File dst) {  
        try {  
            InputStream in = null;  
            OutputStream out = null;  
            try {  
                in = new BufferedInputStream(new FileInputStream(src),  
                        BUFFER_SIZE);  
                out = new BufferedOutputStream(new FileOutputStream(dst),  
                        BUFFER_SIZE);  
                byte[] buffer = new byte[BUFFER_SIZE];  
                while (in.read(buffer) > 0) {  
                    out.write(buffer);  
                }  
            } finally {  
                if (null != in) {  
                    in.close();  
                }  
                if (null != out) {  
                    out.close();  
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
 }
	
	public static void copyFolder(String sourceFolder, String destinationFolder) {
		try {
			File sourceF = new File(sourceFolder);
			if (sourceF.exists())
				FileUtils.copyDirectory(new File(sourceFolder), new File(
						destinationFolder));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("copy file error");
		}

	}

	/**
	 * 下载文件
	 * @param filename  文件名称
	 * @param filepath 文件路径
	 * @throws Exception 异常信息
	 */
	public static void downloadFile(String filename,String filepath) throws Exception {
		 download(filepath,  filename,  ServletActionContext.getResponse().getOutputStream());
	}

	/**
	 * 下载文件
	 * @param filepath  文件路径
	 * @param filedisplay 文件显示名称
	 * @param out  输出流
	 * @throws IOException IO异常
	 */
	public static  void download(String filepath, String filedisplay, OutputStream out)
			throws IOException {
		File f = new File(filepath);
		FileInputStream in = new FileInputStream(f);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[MagicNumber.INT_2048];
		int i = 0;
		while ((i = in.read(b)) != -1) {
			baos.write(b, 0, i);
		}

		ServletActionContext.getResponse().setContentType("bin");
		filedisplay = URLEncoder.encode(filedisplay, "UTF-8");
		ServletActionContext.getResponse().addHeader("Content-Disposition",
				"attachment;filename=" + filedisplay);
		baos.writeTo(out);
		out.flush();
	}
	
	/**
	 * 根据文件名称resource打开输入流，并返回
	 * @param resource
	 * @return
	 */
	public static InputStream openStream(String resource) {
		ClassLoader classLoader = Thread.currentThread()
				.getContextClassLoader();
		InputStream stream = classLoader.getResourceAsStream(resource);

		if (stream == null) {
			stream = FileUtil.class.getClassLoader().getResourceAsStream(resource);
		}

		return stream;
	}
	
	public static InputStream getStreamFromString(String text) {
		try {
			byte[] bytes = text.getBytes("UTF-8");
			return new ByteArrayInputStream(bytes);
		} catch (Exception e) {
			throw new AssertionError(e);
		}
	}

	public static InputStream getStreamFromFile(File file) {
		InputStream stream = null;
		try {
			if (!file.exists()) {
				throw new FlowException("file " + file + " doesn't exist");
			}
			if (file.isDirectory()) {
				throw new FlowException("file " + file + " is a directory");
			}
			stream = new FileInputStream(file);

		} catch (Exception e) {
			throw new FlowException("couldn't access file " + file + ": "
					+ e.getMessage(), e);
		}
		return stream;
	}

	public static InputStream getStreamFromClasspath(String resourceName) {
		org.springframework.core.io.Resource fileRource = new ClassPathResource(resourceName);
		InputStream stream = null;
		try{
		 stream = fileRource.getInputStream();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return stream;
	}

	public static InputStream getStreamFromUrl(URL url) {
		InputStream stream = null;
		try {
			stream = url.openStream();
		} catch (IOException e) {
			throw new FlowException("couldn't open URL stream", e);
		}
		return stream;
	}
	
	public static byte[] readBytes(InputStream in) throws IOException {
		ByteArrayOutputStream output = new ByteArrayOutputStream();
	    byte[] buffer = new byte[4096];
	    int n = 0;
	    while (-1 != (n = in.read(buffer))) {
	        output.write(buffer, 0, n);
	    }
	    return output.toByteArray();
	}

	public static long transfer(InputStream in, OutputStream out)
			throws IOException {
		long total = 0;
		byte[] buffer = new byte[BUFFERSIZE];
		for (int count; (count = in.read(buffer)) != -1;) {
			out.write(buffer, 0, count);
			total += count;
		}
		return total;
	}
	
	/**
	 * input->output字节流copy
	 * @param inputStream
	 * @param outputStream
	 * @return
	 * @throws IOException
	 */
	public static long copy(InputStream inputStream, OutputStream outputStream) throws IOException {
		return copy( inputStream, outputStream, DEFAULT_CHUNK_SIZE );
	}

	/**
	 * input->output字节流copy
	 * @param inputStream
	 * @param outputStream
	 * @param bufferSize
	 * @return
	 * @throws IOException
	 */
	public static long copy(InputStream inputStream, OutputStream outputStream, int bufferSize) throws IOException {
		byte[] buffer = new byte[bufferSize];
		long count = 0;
		int n;
		while ( -1 != ( n = inputStream.read( buffer ) ) ) {
			outputStream.write( buffer, 0, n );
			count += n;
		}
		return count;

	}

	public static long copy(Reader reader, Writer writer) throws IOException {
		return copy( reader, writer, DEFAULT_CHUNK_SIZE );
	}

	/**
	 * 文件复制
	 * @param reader
	 * @param writer
	 * @param bufferSize
	 * @return
	 * @throws IOException
	 */
	public static long copy(Reader reader, Writer writer, int bufferSize) throws IOException {
		char[] buffer = new char[bufferSize];
		long count = 0;
		int n;
		while ( -1 != ( n = reader.read( buffer ) ) ) {
			writer.write( buffer, 0, n );
			count += n;
		}
		return count;

	}
}

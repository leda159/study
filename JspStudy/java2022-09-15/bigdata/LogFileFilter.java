package bigdata;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter{

	PrintWriter writer;

	
	
	//FilterConfig?
		//필터 객체가 초기화되는 시점에 호출되는 init()메서드의
		//매개변수로 전달되는 객체로 web.xml 파일의 정보를 리턴받을 수 있다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		//getInitParameter?
			//web.xml 파일에 있는 init-param 태그에 있는 값을 리턴함
		String filename = filterConfig.getInitParameter("filename"); //
		
		if(filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		}
		
		try {
			
			//PrintWriter:화면에 출력
			//FileWriter:텍스트 문자를 파일에 저장시 사용
			//PrintWriter:문자단위 출력 보조 스트림
			//FileWriter:문자단위 출력 기반 스트림
			//첫번째 true:추가 모드  //두번째 true:autoFlush(출력을 하고 버퍼를 자동으로 비움)
			writer = new PrintWriter(new FileWriter(filename,true),true);
		}catch(IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		
		writer.printf("현재일시:%s %n",getCurrentTime());
		
		String clientAddr = request.getRemoteAddr();
		writer.printf("클라이언트 주소: %s %n",clientAddr);
		
		
		
		
		
		//실행 jsp 이름
		HttpServletRequest req;
		
		//부모클래스에 있는 메서드를 오버라이딩 하거나 자식 클래스에 별도로 작성한 메서드릴 접근
		//하기 위해 부모클래스를 다운캐스팅 처리한다.
		req = (HttpServletRequest)request;
		
		String url = req.getRequestURI();
		writer.printf("접근URL명:%s %n", url);
		
		
		
		
		
		
		filterChain.doFilter(request,response);
		
		String contentType = response.getContentType();
		writer.printf("문서의 콘텐츠 유형: %s %n",contentType);
		writer.printf("----------------------------------");
	}
	
	@Override
	public void destroy() {
		writer.close();
	}
	
	// getCurrentTime():현재 시간을 리턴하는 메서드
	// getInstance():싱글톤 패턴으로 매번 new 연산자를 사용하여 인스턴스를 생성하지않고 
				   //한번만 인스턴스를 생성 후 다음부터는 공유하여 재사용하는 기법
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		
		return formatter.format(calendar.getTime());
	}

}

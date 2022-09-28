package filter;

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

public class LogFileFilter implements Filter {

	PrintWriter writer;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		//getInitParameter?
		//web.xml 파일에 있는 init-param 태그에 있는 값을 리턴		
		String filename = 
				filterConfig.getInitParameter("filename");
		
		if(filename == null) {
			//강제로 예외 발생
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		}
		
		try {
			//PrintWriter:화면에 출력
			//FileWriter:텍스트 문자를 파일에 저장시 사용
			//PrintWriter?문자단위 출력 보조 스트림
			//FileWriter?문자단위 출력 기반 스트림
			//첫번째 true : 추가 모드
			//두번째 true : autoFlush(출력을 하고 버퍼를 자동으로 비움)
			writer = new PrintWriter(
					         new FileWriter(filename,true),true);
		}catch(IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		writer.println("접속한 클라이언트 IP:" + request.getRemoteAddr());
		
		long start = System.currentTimeMillis();
		writer.println("접근한 URL경로:" + getURLPath(request));
		writer.println("요청 처리 시작 시간:" + getCurrentTime());

		chain.doFilter(request,response);
		
		long end = System.currentTimeMillis();
		writer.println("요청 처리 시작 시간:" + getCurrentTime());
		writer.println("요청 처리 소요 시간:" + (end - start) + "ms");
		writer.println("------------------------------------");
	}
	
	@Override
	public void destroy() {
	}

	//접근한 url주소를 리턴하는 메서드
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath = "";
		String queryString = "";
		//instanceof?
		//다운캐스팅을 처리하기전 부모클래스를 상속받은
		//자식클래스인 여부 체크
		if(request instanceof HttpServletRequest) {
			//다운캐스팅 처리
			req = (HttpServletRequest)request;
			
			//접속한 주소값
			currentPath = req.getRequestURI();
			//매개변수 값 리턴
			queryString = req.getQueryString();
			//삼항연산자
			queryString = queryString == null ? "" : "?" + queryString;
		}
		
		return currentPath + queryString;
	}
	
	//현재 시간을 리턴하는 메서드
	private String getCurrentTime() {
		DateFormat formatter = 
				new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		//싱글톤 패턴
		//매번 new 연산자를 사용하여 인스턴스를 생성하지 않고
		//한번만 인스턴스를 생성후 다음부터는 공유하여 재사용하는
		//기법
		Calendar calendar = Calendar.getInstance();
		
		calendar.setTimeInMillis(System.currentTimeMillis());
		
		return formatter.format(calendar.getTime());
	}

}
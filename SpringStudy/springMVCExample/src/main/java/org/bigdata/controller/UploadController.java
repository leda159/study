package org.bigdata.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.bigdata.domain.AttachFileDTO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	//http://localhost:8080/uploadForm
	//views 폴더에 uploadForm.jsp생성
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload Form");
	}
	
	//p497 파일업로드시 처리
	@PostMapping("/uploadFormAction")
	//MultipartFile[]
	//업로드된 파일들 내역이 배열형태로 저장
	public void uploadFormPost(MultipartFile[] uploadFile,Model model) {
		
		//실제 파일 업로드 위치
		String uploadFolder = "c:\\upload";		
		
		//향상된 for문(배열일 경우 사용가능)
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("-------------------------------");
			log.info("업로드 원본 파일명:" + multipartFile.getOriginalFilename());
			log.info("업로드 파일 크기:" + multipartFile.getSize());
			
			//파일을 생성하기 위해 객체 선언
			File saveFile = new File(uploadFolder,multipartFile.getOriginalFilename());
			
			try{
				
				//해당파일 업로드 폴더에 생성
				multipartFile.transferTo(saveFile);
				
			}catch(Exception e) {
				log.error(e.getMessage());
			}
			
		}
	}
	
	//http://localhost:8080/uploadAjax
	//views 폴더에 uploadAjax.jsp 생성
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("uploadAjax");
	}

	//Ajax를 이용하여 파일 업로드 처리
	@PostMapping(value="/uploadAjaxAction",
				 //서버가 클라이언트에게 JSON형태로 응답처리
			     produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		//첨부파일을 대입하기 위해 ArrayList 인스턴스 생성
		List<AttachFileDTO> list = new ArrayList<>();
		
		String uploadFolder = "c:\\upload";
		String uploadFolderPath = getFolder();
				
		File uploadPath = new File(uploadFolder,uploadFolderPath);
		log.info("업로드 경로:" + uploadPath);
		
		//만약 업로드 폴더가 존재하지 않으면 생성
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//c:\\test\\image\\a.jpg
			//파일경로에서 파일명만 추출
			//Internet Explorer인 경우
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("업로드 파일명:" + uploadFileName);
			
			//p518 업로드 파일명을 AttachDTO에 대입
			attachDTO.setFileName(uploadFileName);
			
			//p511 파일 업로드시 파일명에 uuid 적용
			//uuid값을 랜덤으로 발생시켜 파일명에 적용
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				
				File saveFile = new File(uploadPath,uploadFileName);
				//c드라이브 upload 폴더에 저장 
				multipartFile.transferTo(saveFile);
				
				//p518 랜덤으로 발생된 uuid값을 AttachDTO 대입
				attachDTO.setUuid(uuid.toString());
				//업로드 파일 경로를 AttachDTO 대입
				attachDTO.setUploadPath(uploadFolderPath);
				
				//p514
				//만약에 업로드하는 파일이 이미지이면
				//썸네일 파일 자동으로 생성
				if(checkImageType(saveFile)) {
					
					//p518
					//업로드 파일이 이미지 인지 여부를 AttachDTO 대입
					attachDTO.setImage(true);
					
					//바이트 단위 출력 보조 스트림
					FileOutputStream thumbnail = 
						new FileOutputStream(
							//문자 단위 파일 기반 스트림	
							new File(uploadPath,"s_" + 
						             uploadFileName));
					//썸네일 크기 100px*100px으로 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					thumbnail.close();
					
				}
				
				//p518 첨부파일을 ArrayList에 추가
				list.add(attachDTO);
				
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}//
		
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	//p526
	@GetMapping("/display")
	//자바 객체를 json 형태로 변환하여 http Body에 담는
	//기능을 하는 어노테이션
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			//헤더 정보를 가지고 있는 객체
			HttpHeaders header = new HttpHeaders();
			
			//매개변수로 받은 파일의 MIME값을 헤더정보에 추가
			header.add("Content-Type",Files.probeContentType(file.toPath()));
			
			//파일을 스트림으로 복사하여 사용한 후 자동으로 close
			//보려는 이미지를 inputStream을 이용하여
			//바이트배열에 대입처리하는 메서드
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
					
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}//
	
	//p531 첨부파일 이미지 클릭시 원본이미지 보여주기
	//일반파일 클릭시 다운로드 처리	
	@GetMapping(value="/download",
				//클라이언트 응답처리시 다운로드를 처리할 수 있도록 선언
			    produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	//Resource:자원에 대한 정보를 가지고 있는 객체
	public ResponseEntity<Resource> downloadFile(
					//Http request 헤더 정보를 해당 메서드의 매개변수
					//로 전달하는 어노테이션
					//User-Agent?
					//현재 사용중인 웹브라우저 종류를 가지는 속성
					@RequestHeader("User-Agent") String userAgent,
					String fileName){
		
		//FileSystemResource?
		//특정 파일의 세부 정보를 리턴하는 객체
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		
		//만약 다운로드 하려는 파일이 존재하지 않으면 404 처리
		if(resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		//p532
		//다운로드 하려는 파일명
		String resourceName = resource.getFilename();
		
		//p539 파일 다운로드시 uuid 제외하기
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			String downloadName = null;
			
			if(userAgent.contains("Trident")) {//IE
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8").replaceAll("\\+"," ");
			}else if(userAgent.contains("Edge")) {//엣지인 경우
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8");
			}else {//크롬
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			//현재 사용중인 웹 브라우저가 크롬인 경우
			headers.add("Content-Disposition","attachment; filename=" + downloadName);
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
		
		
		
	}
	
	//p508 파일업로드시 일자폴더를 생성하여 업로드 처리
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		//폴더를 2022폴더 밑에 10폴더밑에 18일 폴더를 생성
		return str.replace("-",File.separator);
	}

	//p513 업로드 파일이 이미지 파일인지 체크하는 메서드
	private boolean checkImageType(File file) {
		try {
			
			//probeContentType?
			//파일의 확장자를 이용하여 MIME 타입을 판단
			String contentType = Files.probeContentType(file.toPath());
			
			//MIME문자열이 image로 시작하면
			//true를 리턴
			return contentType.startsWith("image");
					
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}//
}










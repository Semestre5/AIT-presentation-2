vcl 4.0;

import directors;

backend node1 {
  .host = "192.168.42.11";
  .port = "3000";
}

backend node2 {
  .host = "192.168.42.12";
  .port = "3000";
}

sub vcl_init {
    new balancer = directors.round_robin();
    balancer.add_backend(node1);
    balancer.add_backend(node2);
}

sub vcl_recv {
    set req.backend_hint = balancer.backend();
    if (req.url ~ "^[^?]*\.(7z|avi|bmp|bz2|css|csv|doc|docx|eot|flac|flv|gif|gz|ico|jpeg|jpg|js|less|mka|mkv|mov|mp3|mp4|mpeg|mpg|odt|ogg|ogm|opus|otf|pdf|png|ppt|pptx|rar|rtf|svg|svgz|swf|tar|tbz|tgz|ttf|txt|txz|wav|webm|webp|woff|woff2|xls|xlsx|xml|xz|zip)(\?.*)?$") {
        unset req.http.Cookie;
	    unset req.http.Authorization;
	      # Only keep the following if VCL handling is complete
        return(hash);
    }
}

sub vcl_backend_response {
    if (bereq.url ~ "^[^?]*\.(7z|avi|bmp|bz2|css|csv|doc|docx|eot|flac|flv|gif|gz|ico|jpeg|jpg|js|less|mka|mkv|mov|mp3|mp4|mpeg|mpg|odt|ogg|ogm|opus|otf|pdf|png|ppt|pptx|rar|rtf|svg|svgz|swf|tar|tbz|tgz|ttf|txt|txz|wav|webm|webp|woff|woff2|xls|xlsx|xml|xz|zip)(\?.*)?$") {
        unset beresp.http.Set-Cookie;
        set beresp.http.Cache-Control = "max-age=28800"; //set this header
        set beresp.ttl = 1d; // cache this static item for one day
    }
    else{
        set beresp.ttl = 0s; //don't cache other page 
    }
}

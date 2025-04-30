=> ERROR [ 7/12] RUN curl "https://github.com/AK-IT-Solutions-BV/Anthias/releases/download/WebView-v0.3.7/webview-6.4.  0.6s 
------                                                                                                                        
 > [ 7/12] RUN curl "https://github.com/AK-IT-Solutions-BV/Anthias/releases/download/WebView-v0.3.7/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz"         -sL -o "/tmp/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz" &&     curl "https://github.com/AK-IT-Solutions-BV/Anthias/releases/download/WebView-v0.3.7/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz.sha256"         -sL -o "/tmp/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz.sha256" &&     cd /tmp &&     sha256sum -c "webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz.sha256" &&     tar -xzf "/tmp/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz" -C /usr/local &&     rm "webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz":
0.602 sha256sum: webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz.sha256: no properly formatted checksum lines found
------
ERROR: failed to solve: process "/bin/sh -c curl \"https://github.com/AK-IT-Solutions-BV/Anthias/releases/download/WebView-v0.3.7/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz\"         -sL -o \"/tmp/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz\" &&     curl \"https://github.com/AK-IT-Solutions-BV/Anthias/releases/download/WebView-v0.3.7/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz.sha256\"         -sL -o \"/tmp/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz.sha256\" &&     cd /tmp &&     sha256sum -c \"webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz.sha256\" &&     tar -xzf \"/tmp/webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz\" -C /usr/local &&     rm \"webview-6.4.2-bookworm-x86-fb2cb9e.tar.gz\"" did not complete successfully: exit code: 1
Building and pushing anthias-nginx...



--------------------------------------


 anthias-server  Internal Server Error: /settings
 anthias-server  Traceback (most recent call last):
 anthias-server    File "/usr/local/lib/python3.11/dist-packages/django/core/handlers/exception.py", line 55, in inner
 anthias-server      response = get_response(request)
 anthias-server                 ^^^^^^^^^^^^^^^^^^^^^
 anthias-server    File "/usr/local/lib/python3.11/dist-packages/django/core/handlers/base.py", line 197, in _get_response
 anthias-server      response = wrapped_callback(request, *callback_args, **callback_kwargs)
 anthias-server                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 anthias-server    File "/usr/src/app/lib/auth.py", line 222, in decorated
 anthias-server      orig(*args, **kwargs)
 anthias-server    File "/usr/local/lib/python3.11/dist-packages/django/views/decorators/http.py", line 43, in inner
 anthias-server      return func(request, *args, **kwargs)
 anthias-server             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 anthias-server    File "/usr/src/app/anthias_app/views.py", line 128, in settings_page
 anthias-server      settings.save()
 anthias-server    File "/usr/src/app/settings.py", line 152, in save
 anthias-server      self.load()
 anthias-server    File "/usr/src/app/settings.py", line 136, in load
 anthias-server      self._get(config, section, field, default)
 anthias-server    File "/usr/src/app/settings.py", line 110, in _get
 anthias-server      self[field] = hashlib.sha256(self[field]).hexdigest()
 anthias-server                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
 anthias-server  TypeError: Strings must be encoded before hashing
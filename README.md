# face_recog_obama

🐳 根据 `face_recognize` 创建一个简单的镜像.     
判断图片有无人脸、以及人脸是否为 Obama.
`face.py` 为 `face_recognize` 下的一个[例子](https://github.com/ageitgey/face_recognition/blob/master/examples/web_service_example.py)

## build
因为在创建镜像的时候，在 Dockerfile 的 `git clone` 处出现问题 (一直处于 cloning into... 状态，不知问题在哪).
所以先本地 clone，在 Dockerfile 里执行 COPY.
```
git clone https://github.com/yantanglife/face_recog_obama.git
cd face_recog_obama
git clone https://github.com/davisking/dlib.git
docker build -t face_obama .
docker run -d --name face_obama_container -p 10001:10001 face_obama
```

## use
```
curl -X POST -F "file=@pic.jpg" http://<ip-addr>:10001/
```
返回结果如下：
```
{
  "face_found_in_image": true,
  "is_picture_of_obama": true
}

```
## besides
可以修改 `face.py` ，识别更多的人脸.
`face.py` 中直接使用了一个 128 维的 list (对应 Obama 脸的编码).
可以使用 `face_recognition.face_encodings(img)` 得到任意一张包含人脸的图片编码.
此外，在 `face_recognition.compare_faces()` 处可以循环比较多张已知的人脸图片，
得到目标图片中人物的名称，同时修改 `jsonify(result)` 的输出格式.

## reference
[https://github.com/danzarov/face_recog](https://github.com/danzarov/face_recog)

[https://hub.docker.com/r/aaftio/face_recognition/dockerfile](https://hub.docker.com/r/aaftio/face_recognition/dockerfile)
# face_recog_obama

判断图片有无人脸、以及人脸是否为 obama.
face.py 为 face_recognize 下的一个[例子](https://github.com/ageitgey/face_recognition/blob/master/examples/web_service_example.py)

## build
因为在创建镜像的时候，在 git clone 处出现问题
所以先本地clone，再执行COPY
```
git clone https://github.com/yantanglife/
cd face_recog_obama
git clone dlib
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

## reference

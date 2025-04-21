# استخدم صورة Python الرسمية
FROM python:3.10-slim

# تحديد مجلد العمل داخل الكونتينر
WORKDIR /app

# نسخ ملفات المشروع إلى داخل الكونتينر
COPY . /app

# تثبيت المتطلبات
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# تحديد البورت اللي هيشتغل عليه السيرفر
EXPOSE 5000

# الأمر اللي بيشغل السيرفر (تأكد إن اسم الملف هو app.py والـ Flask app اسمها app)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]


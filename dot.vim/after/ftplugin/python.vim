
if getline(1) =~ 'from django.db import models'
    runtime! ftplugin/django_model_snippets.vim
endif

if getline(1) =~ 'from django.core import meta'
Iabbr addmodel class <>(meta.Model):<CR><><CR><CR>def __repr__(self):<CR>return "%s" % (<>)<CR><CR>class META:<CR>admin = meta.Admin()
Iabbr mcf meta.CharField(maxlength=<>)<CR><>
Iabbr mif meta.ImageField(upload_to='<>')<CR><>
Iabbr mff meta.FileField(upload_to='<>')<CR><>
Iabbr mint meta.IntegerField()<CR><>
Iabbr mtf meta.TextField()<CR><>
Iabbr m2m meta.ManyToManyField(<>, verbose_name='<>')<CR><>
Iabbr mfk meta.ForeignKey(<>, verbose_name='<>')<CR><>
Iabbr o2o meta.OneToOneField(<>, verbose_name='<>')<CR><>
endif

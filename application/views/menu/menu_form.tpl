{extends file='templates/application.tpl'}
{block name=title}{$title}{/block}
{block name=include}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="{base_url}assets/css/jquery.fileupload.css">
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>

    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
    <script src="{base_url}assets/js/load-image.all.min.js"></script>
    <!-- The Canvas to Blob plugin is included for image resizing functionality -->
    <script src="{base_url}assets/js/canvas-to-blob.min.js"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <script src="{base_url}assets/js/jquery.iframe-transport.js"></script>
    <!-- The basic File Upload plugin -->
    <script src="{base_url}assets/js/jquery.fileupload.js"></script>
    <!-- The File Upload processing plugin -->
    <script src="{base_url}assets/js/jquery.fileupload-process.js"></script>
    <!-- The File Upload image preview & resize plugin -->
    <script src="{base_url}assets/js/jquery.fileupload-image.js"></script>
    <!-- The File Upload audio preview plugin -->
    <script src="{base_url}assets/js/jquery.fileupload-audio.js"></script>
    <!-- The File Upload video preview plugin -->
    <script src="{base_url}assets/js/jquery.fileupload-video.js"></script>
    <!-- The File Upload validation plugin -->
    <script src="{base_url}assets/js/jquery.fileupload-validate.js"></script>
    <script src="{base_url}assets/js/holder.min.js"></script>
    <script src="{base_url}assets/js/image-upload.js"></script>

{/block}
{block name=main_contents}
    <div class="container">
        <div class="row">
            <div class="col-sx-12 col-md-4" style="background-color: #00CC00;">
                <span class="fileinput-button">
                    <div class="img-thumbnail">
                        <img id="img-menu" data-src="holder.js/295x200?text=ここをクリックして画像を登録">
                    </div>
                    <!-- The file input field used as target for the file upload widget -->
                    <input id="fileupload" type="file" name="files[]" />
                </span>
                <!-- The global progress bar -->
                <div id="progress" class="progress">
                    <div class="progress-bar progress-bar-success"></div>
                </div>
                <!-- The container for the uploaded files -->
                <div id="files" class="files"></div>

            </div>
            <div class="col-sx-12 col-md-8" style="background-color: #aa0000;height: 50px;">

            </div>
        </div>
    </div>
{/block}
{block name=footer_left}
    {if $id}
        <a href="{base_url}menu/delete/{$id}" class="btn btn-delete box rd24 font-pop"
           style="font-size: large;">
            <span class="fa fa-trash"></span><span class="spNone"> 削除</span>
        </a>
    {/if}
{/block}
{block name=footer_right}
    <button type="submit" class="btn btn-orange box rd24 font-pop spNone"
            style="margin-right:15px;font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存してもう１つ追加</span>
    </button>
    <a href="{base_url}menu/list" class="btn btn-orange box rd24 font-pop"
       style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存する</span>
    </a>
{/block}

Vue.component('file-row-simple', {
  data: function() {
    return {
      textMaxLength: 100
    };
  },
  props: {
    file: Object,  // the file in the row
    tr: Object,    // translations
    locale: String
  },
  computed: {
    iconClass: function() {
      return this.isFile ? 'far fa-file' : 'fa fa-folder';
    },
    isFile: function() {
      return this.file.type === 'FILE';
    },
    hasMediaType: function() {
      return this.file.mediaType && this.file.mediaType.trim() !== '';
    },
    descriptionLabel: function() {
      if (this.isFile && this.file.description && this.file.description.length>0) {
        let desc = this.file.description.filter(item => item.lang === this.locale).pop();
        if (!desc) {
          desc = this.file.description.pop();
        }
        return desc.value.length>this.textMaxLength ? desc.value.substring(0, this.textMaxLength) + ' ...' : desc.value;
      }
      return '';
    },
    hasDescriptionTitle: function() {
      return this.descriptionTitle.length>this.textMaxLength;
    },
    descriptionTitle: function() {
      if (this.isFile && this.file.description && this.file.description.length>0) {
        let desc = this.file.description.filter(item => item.lang === this.locale).pop();
        if (!desc) {
          desc = this.file.description.pop();
        }
        return desc.value;
      }
      return '';
    }
  },
  template: `
  <tr class="border-0">
    <td v-if="isFile">
      <span>
        <i v-bind:class="iconClass" class="pr-2"></i>
        <a v-if="file.size>0" download :href="'/ws/file-dl' + file.path">{{ file.name }} </a>
        <span v-else>{{ file.name }} </span>
        <span class="badge badge-success" v-if="hasMediaType">{{ file.mediaType }}</span>
      </span>
    </td> 
<!--    <td><small>{{ descriptionLabel }}</small> <i class="fas fa-info-circle" :title="descriptionTitle" v-if="hasDescriptionTitle"></i></td> -->
<!--    <td><a v-if="file.size>0" download :href="'/ws/file-dl' + file.path"><i class="fa fa-download"></i><span class="badge badge-info" v-if="hasMediaType">{{ file.mediaType }}</span></a></td> -->
    </tr>`
});
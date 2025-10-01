const yaml = require('js-yaml');
const fs = require('fs');

try {
  const yamlContent = fs.readFileSync('source/_data/authors.yml', 'utf8');
  const jsonObject = yaml.load(yamlContent);
  const jsonString = JSON.stringify(jsonObject, null, 2);
  fs.writeFileSync('source/_data/authors.json', jsonString);  
} catch (e) {
  console.error('转换过程中出现错误:', e);
}

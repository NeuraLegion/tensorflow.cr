# tensorflow.cr

TensorFlow bindings in Crystal.  
The aim of this shard is to expose all the C API functionality.  

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  tensorflow:
    github: NeuraLegion/tensorflow.cr
```

then run `crystal deps update`

## Usage

Right now the status is WIP, nothing really works, see specs for current coverage

## Development

TODO:  
- [ ] Graph  
- [x] Status  
- [ ] Tensor  
- [ ] Session  
- [ ] Ops  

For references and ideas you can use:  
- [tensorflow.rb](https://github.com/somaticio/tensorflow.rb)  
- [Offical Docs](https://www.tensorflow.org/extend/language_bindings)  

## Contributing

1. Fork it ( https://github.com/NeuraLegion/tensorflow.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [bararchy](https://github.com/bararchy) creator, maintainer
